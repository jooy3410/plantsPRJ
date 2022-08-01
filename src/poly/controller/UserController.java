package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.ImgDTO;
import poly.dto.MailDTO;
import poly.dto.UserDTO;
import poly.service.IImgService;
import poly.service.IMailService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	
	/*
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤 패턴 전용됨)
	 */
	@Resource(name = "UserService")
	private IUserService userService;
	
	@Resource(name="MailService")
	private IMailService mailService;
	
	@Resource(name="ImgService")
	private IImgService imgService;
	
	
	
	/**
	 * 회원가입화면으로 이동
	 */
	@RequestMapping(value="user/UserRegForm")
	public String userReForm() {
		log.info(this.getClass().getName() + ".user/userRegForm ok");
		
		
		return "/user/UserRegForm";
		
		
	}
	
	
	/**
	 * 회원가입
	 * 
	 */
	@RequestMapping(value = "user/insertUserInfo", method = RequestMethod.POST)
    public String insertUserInfo(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {

		log.info(getClass().getName() + ".insertUserInfo start");
		
		//회원가입 결과에 대한 메시지를 전달할 변수
		String msg = "";
		
		String url = "";
		
		//웹에서 받는 정보를 저장할 변수
		UserDTO pDTO = null;
		
		/*
		 * ###############################################################
		 * 웹(회원정보 입력화면)에서 받는 정보를 String 변수에 저장 시작!!
		 * 
		 * 무조건 웹으로 받은 정보는 DTO에 저장하기 위해 임시로 String 변수에 저장함
		 * ###############################################################
		 */
		
		String email = CmmUtil.nvl(request.getParameter("email")); //아이디
		String password = CmmUtil.nvl(request.getParameter("password"));//비밀번호
		String user_name = CmmUtil.nvl(request.getParameter("user_name"));//닉네임
		
		/*
		 * ###############################################################
		 * 웹(회원정보 입력화면)에서 받는 정보를 String 변수에 저장 시작!!
		 * 
		 * 무조건 웹으로 받은 정보는 DTO에 저장하기 위해 임시로 String 변수에 저장함
		 * ###############################################################
		 */
		
		/*
		 * ################################################################
		 * 반드시, 값을 받았으면, 꼭 로그를 찍어서 값이 제대로 들어오는지 파악해야한다.
		 * ################################################################
		 */
		log.info("email : "+ email);
		log.info("password : " + password);
		log.info("user_name : " + user_name);
		
		/*
		 * ################################################################
		 * 웹(회원정보 입력화면)jsp에서 받은 정보를 DTO에 저장하기 시작!!
		 * 무조건 웹으로 받은 정보는 DTO에 저장해야한다고 이해하길권함
		 * ################################################################
		 *
		 */
		log.info("String저장끝");
		
		log.info("pDTO저장 시작!");
		
		//웹(회원정보 입력화면)에서 받은 정보 저장할 변수를 메모리에 올리기
		pDTO = new UserDTO();
		pDTO.setEmail((email));
		//복호화 되지 않도록 해시 알고리즘으로 암호화
		pDTO.setPassword(EncryptUtil.encHashSHA256(password));
		pDTO.setUser_name(user_name);
		
		log.info("res 시작");
		
		// DB에 값이 잘 저장되었다면, 1반환
		int res = userService.insertUserInfo(pDTO);
        log.info("res : " + res);
        
        //회원정보 불러오기
        UserDTO rDTO = userService.getUserInfo(pDTO);
		
		if(rDTO == null) {
			rDTO = new UserDTO();
		}
		
		String user_auth = rDTO.getUser_author();
       
                      
        if (res > 0) {
                msg = "회원가입을 축하드립니다.";
                session.setAttribute("SS_USER_NAME", user_name);
                session.setAttribute("SS_USER_AUTH", user_auth);
                
        } else {
                msg = "회원정보를 확인 후 가입을 진행해 주세요.";
                }

        url = "/index.do";
        log.info("model.addAttribute");
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        pDTO = null;
        log.info("insertUserInfo End!");
        return "/redirect";
    }
	
	/*
	 * 이메일 중복체크
	 * @ResponseBody 사용으로, http에 값(res) 전달
	 */
	@ResponseBody
	@RequestMapping(value = "signup/emailCheck", method = RequestMethod.POST)
	public int emailCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model) 
			throws Exception{
		
		log.info("Email check Start");
		
		String email = CmmUtil.nvl(request.getParameter("email"));
		log.info("email : " + email);
		
		UserDTO pDTO = new UserDTO();
		pDTO.setEmail(email);
		
		UserDTO rDTO = new UserDTO();
		log.info("userService.emailCheck Start!");
		rDTO = userService.emailCheck(pDTO);
		log.info("userService.emailCheck End!");
		
		int res = 0;
		
		//값이 있다면, res = 1
		if (rDTO != null) {
			res = 1;
		}
		
		pDTO = null;
		rDTO = null;
		
		log.info("res : " + res);
		log.info("Email Check End!");
		
		
		return res;
	}
	
	
	
	/*
	 * 닉네임 중복확인
	 */
	
	@ResponseBody
	@RequestMapping(value = "signup/nameCheck", method = RequestMethod.POST)
	public int nameCheck(HttpServletRequest request) throws Exception {
		
		log.info("name Check Strart!");
		
		String user_name = CmmUtil.nvl(request.getParameter("user_name"));
		log.info("user_name : " + user_name );
		
		UserDTO pDTO = new UserDTO();
		pDTO.setUser_name(user_name);
		
		UserDTO rDTO = new UserDTO();
		log.info("userService.nameCheck Start!");
		
		rDTO = userService.nameCheck(pDTO);
		log.info("userService.nameCheck END");
		
		int res = 0;

        // 값이 있다면, res = 1
        if (rDTO != null) {
            res = 1;
        }

        pDTO = null;
        rDTO = null;

        log.info("res : " + res);
        log.info("NAME Check End!");

        return res;
    }
	
	/*
	 * 로그인을 위한 입력 화면으로 이동
	 * 
	 */
	@RequestMapping(value = "user/Login")
	public String login() {
		
		log.info(this.getClass().getName() + ".login 시작!");

		return "/user/Login";
	}
	/**
	 * 로그인 처리 및 결과 알려주는 화면으로 이동
	 * 
	 */
	@RequestMapping(value="user/getLoginCheck", method = RequestMethod.POST)
	public String getLoginCheck(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info(this.getClass().getName()+ ".getUserLoginCheck start!");
		
		//로그인 처리 결과를 저장할 변수 (로그인 성공 : 1, 아이디, 비밀번호 불일치로 인한 실패 : 0, 시스템 에러 :2)
		
		int res = 0;
		
		
		UserDTO pDTO = null;
		
		log.info("try");
		
		try {
			/*
			 * #################################
			 * 웹(회원정보 입력화면에서 받는 정보를 String 변수에 저장 시작!!
			 * 
			 * 무조건 웹으로 받은 정보는 DTO에 저장하기 위해서 임시로 String  변수에 저장함
			 * #################################
			 */
			String email = CmmUtil.nvl(request.getParameter("email")); //아이디
			String password = CmmUtil.nvl(EncryptUtil.encHashSHA256(request.getParameter("password")));//비밀번호
			/*
			 * #################################
			 * 웹 (회원정보 입력화면)에서 받는 정보를 String변수에 저장끝!!
			 * #################################
			 */
			
			/*
			 * ###########################################################
			 * 반드시, 값을 받았으면, 꼭 로그를 찍어서 값이 제대로 들어오는지 파악해야함
			 * ##########################################################
			 */
			log.info("email : "+ email );
			log.info("password : "+ password);
			
			/*
			 * #############################################################
			 * 웹(회원정보 입력화면)에서 받는 정보를 DTO에 저장 시작
			 * #############################################################
			 */
			
			//웹(회원정보 입력화명)에서 받는 정보를 저장할 변수를 메모리에 올리기
			pDTO = new UserDTO();
			log.info("pDTO저장시작");
			
			pDTO.setEmail(email);
			pDTO.setPassword(password);
			
			log.info("pDTO.email : " + pDTO.getEmail());
	        log.info("pDTO.password : " + pDTO.getPassword());
	        log.info("userService.getLogin 시작");
			
			/*
			 * #####################################################
			 * 웹(회원정보 입력화면)에서 받는 정보를 DTO에 저장하기 끝!!
			 * #####################################################
			 */
			UserDTO rDTO = userService.getUserInfo(pDTO);
			
			if(rDTO == null) {
				rDTO = new UserDTO();
			}

			// 로그인을 위해 아이디와 비밀번호가 일치하는지 확인
			res = userService.getLoginCheck(pDTO);


			if (res == 1) { // 로그인 성공
				
				//관리자 여부 확인
				String user_auth = rDTO.getUser_author();
				String user_name = rDTO.getUser_name();
				String user_no = rDTO.getUser_no();
				
				session.setAttribute("SS_USER_NO", user_no);
				session.setAttribute("SS_USER_NAME", user_name);
				session.setAttribute("SS_USER_AUTH", user_auth);
			}

		}catch(Exception e) {
			//저장이 실패되면 사용자에게 보여줄 메시지
			res = 2;
			log.info(e.toString());
			e.printStackTrace();
			
		}finally {
			log.info(this.getClass().getName() + ".insertUserInfo end!");
			
			/*
			 * 로그인 처리 결과를 jsp에 전달하기 위해 변수 사용
			 * 숫자 유형의 데이터 타입은 값을 전달하고 받는데 불편함이 있어
			 * 문자 유형(String)으로 강제 형변화하여 jsp에 전달한다.
			 */
			model.addAttribute("res", String.valueOf(res));
			
			log.info("로그인끝!");
			
			pDTO = null;
			
		}
		
		
		return "/user/LoginResult";
	}
	
	//로그아웃
	@RequestMapping(value = "user/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse reponse, ModelMap model, HttpSession session)
			throws Exception {
		log.info(getClass().getName() + ".logout 성공!");

		session.invalidate();
		

		return "/redirect";
	}
	
	
	// 로그아웃
    @RequestMapping(value = "/logOut")
    public String logOut(HttpSession session, ModelMap model) throws Exception {
        log.info("logOut Start!");

        String msg = "로그아웃 되었습니다.";
        String url = "/Index.do";

        // 세션 삭제(user_name, user_no) - invalidate() 또는 removeAttribute 함수 사용
        session.removeAttribute("SS_USER_NAME");
        session.removeAttribute("SS_USER_NO");
        
        session.removeAttribute("SS_USER_AUTH");

        // 세션이 정상적으로 삭제되었는지 로그를 통해 확인
        log.info("session deleted ? : " + session.getAttribute("SS_USER_NO"));
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        log.info("session delete, model.addAttribute 끝!");
        log.info("logOut End!");

        return "/redirect";
    }
    
	
	
	// 비밀번호 찾기 화면
		@RequestMapping(value = "user/passSearch")
		public String PassSearch() {
			log.info(this.getClass().getName() + ".passSearch Page");

			return "/user/passSearch";
		}
		
		
		// 비밀번호 초기화를 위해 이메일로 발송된 인증번호 입력창
		@RequestMapping(value = "user/passCert")
		public String PassCert(HttpServletRequest request, HttpServletResponse reponse, ModelMap model, HttpSession session)
				throws Exception {
			
			log.info(this.getClass().getName() + ".passReset start");

			String email = CmmUtil.nvl(request.getParameter("email"));
			log.info("email : " + email);
			
			
			String certNumber = CmmUtil.nvl(userService.certNumber());
			log.info("certNumber : " + certNumber);

				UserDTO pDTO = new UserDTO();
				
				
				pDTO.setEmail(email);

				UserDTO rDTO = userService.pwcheckUserInfo(pDTO);

				MailDTO mDTO = new MailDTO();
				mDTO.setToMail(CmmUtil.nvl(rDTO.getEmail()));
				mDTO.setTitle("요청하신 인증번호를 알려드립니다.");
				mDTO.setContents("아래의 인증번호를 인증번호 입력창에 입력해 주세요.\n\n 인증번호 : " + certNumber);

				mailService.doSendMail(mDTO);
				

			model.addAttribute("email", email);
			model.addAttribute("certNumber", certNumber);

			return "/user/certInput";
		}
		
		// 비밀번호 초기화 페이지
				@RequestMapping(value = "user/passChg")
				public String passChg(HttpServletRequest request, HttpServletResponse reponse, ModelMap model, HttpSession session)
						throws Exception {
					
					log.info(this.getClass().getName() + ".passChg start");
			
					String email = CmmUtil.nvl(request.getParameter("email"));
					
					model.addAttribute("email", email);
					
					return "/user/passChg";
				}
				
				
				// 비밀번호 재설정
				@RequestMapping(value = "user/passReset")
				public String passReset(HttpServletRequest request, HttpServletResponse reponse, ModelMap model,
						HttpSession session) throws Exception {
					
					log.info(this.getClass().getName() + ".passReset start");

					String msg = "";

					String email = CmmUtil.nvl(request.getParameter("email"));
					String password = CmmUtil.nvl(request.getParameter("password"));

					
						UserDTO pDTO = new UserDTO();

						pDTO.setEmail(email);
						pDTO.setPassword(EncryptUtil.encHashSHA256(password));

						int res = userService.changePwd(pDTO);

						log.info("password : " + password);

						if (res == 1) {
							msg = "변경에 성공했습니다.";
						} else {
							msg = "오류로 인해 변경에 실패했습니다.";
						}
					

					model.addAttribute("msg", msg);

					return "/user/chgResult";
				}
				
				
				/**
				 * 회원정보수정화면으로 이동(회원정보 수정 진짜!!)
				 */
				@RequestMapping(value="user/userInfoChg")
				public String userInfoChg() {
					log.info(this.getClass().getName() + ".user/userInfoChg ok");
					
					
					return "/user/userInfoChg";
					
					
				}
				
				
				
				
				// 회원정보 수정 페이지
				@RequestMapping(value = "user/ChgUserInfo")
				public String ChgUserInfo(HttpServletRequest request, HttpServletResponse reponse, ModelMap model,
						HttpSession session, @RequestParam(value = "res", required = false) String res) throws Exception {
					log.info(this.getClass().getName() + ".ChgUserInfo start");

					res = CmmUtil.nvl(res);

					String passwordC = EncryptUtil.encHashSHA256(request.getParameter("passwordC"));
					String user_name = (String) session.getAttribute("SS_USER_NAME");

					UserDTO rDTO = new UserDTO();

			
					UserDTO pDTO = new UserDTO();
						pDTO.setUser_name(user_name);

						rDTO = userService.pwcheckUserInfo(pDTO);

						if (passwordC.equals(rDTO.getPassword())) {
							res = "1";
						} else {
							res = res + "a";
						}

					log.info("passwordC : " + passwordC);
					
					model.addAttribute("rDTO", rDTO);
					model.addAttribute("res", res);
			
					rDTO = null;
							
					return "/user/ChgUserinfo";
				}
				
				
				// 회원정보 변경 DB 업데이트
				@RequestMapping(value = "user/chgUserInfo")
				public String chgUserInfo(HttpServletRequest request, HttpServletResponse reponse, ModelMap model,
						HttpSession session) throws Exception {
					
					log.info(this.getClass().getName() + ".chgUserInfo start");


					String msg = "";

					int res = 0;

						
						
						String email = CmmUtil.nvl(request.getParameter("email"));
						String password = CmmUtil.nvl(request.getParameter("password"));
						String user_name = CmmUtil.nvl(request.getParameter("user_name"));
						
						
						UserDTO pDTO = new UserDTO();

						pDTO.setEmail(email);
						pDTO.setPassword(EncryptUtil.encHashSHA256(password));
						pDTO.setUser_name(user_name);
						res = userService.updUserInfo(pDTO);

						if (res == 1) {
							msg = "변경에 성공했습니다.";
						} else {
							msg = "오류로 인해 변경에 실패했습니다.";
						}

					model.addAttribute("msg", msg);
					log.info(this.getClass().getName() + ".chgUserInfo end!!!");

					return "/redirect";
				}
				
				
				//회원탈퇴 페이지
				@RequestMapping(value ="user/userExit")
				public String UserExit(HttpServletRequest request, HttpServletResponse reponse, ModelMap model,
						HttpSession session) throws Exception {
					
					log.info(this.getClass().getName() + ".UserExit start");
					
					String user_name = (String) session.getAttribute("SS_USER_NAME");
					
					UserDTO rDTO = new UserDTO();

					UserDTO pDTO = new UserDTO();
						pDTO.setUser_name(user_name);

						rDTO = userService.pwcheckUserInfo(pDTO);
						
					model.addAttribute("rDTO", rDTO);
					
					log.info(this.getClass().getName() + ".UserExit end!!!");

					return "/user/userExit";
					
				}

				// 회원탈퇴 DB업데이트
				@RequestMapping(value = "user/delUser")
				public String delUser(HttpServletRequest request, HttpServletResponse reponse, ModelMap model,
						HttpSession session) throws Exception {
					
					log.info(this.getClass().getName() + ".delUser start");


					String msg = "";

					int res = 0;

						String Email = CmmUtil.nvl(request.getParameter("email"));
						String password = CmmUtil.nvl(request.getParameter("password"));

						UserDTO pDTO = new UserDTO();

						pDTO.setEmail(Email);
						pDTO.setPassword(EncryptUtil.encHashSHA256(password));

						res = userService.delUserInfo(pDTO);

						if (res == 1) {
							msg = "탈퇴에 성공했습니다.";
							session.invalidate();
						} else {
							msg = "오류로 인해 변경에 실패했습니다.";
						}

					model.addAttribute("msg", msg);
					log.info(this.getClass().getName() + ".delUser end!!!");

					return "/redirect";
				}
				
				//유저 정보
				 @ResponseBody
				    @RequestMapping(value="/getUserAjax")
				    public UserDTO getUserAjax(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
				        // 로그인한 세션의 회원 번호로 상세정보 조회를 위해 회원번호를 저장함
				        String user_no = (String) session.getAttribute("SS_USER_NO");

				        UserDTO pDTO = new UserDTO();
				        pDTO.setUser_no(user_no);
				        log.info("회원 정보 조회를 위한 user_no : " + pDTO.getUser_no());

				        // 회원번호에 해당하는 회원 정보를 가져옴
				        UserDTO rDTO = userService.getUserDetail(pDTO);
				        log.info("rDTO null? : " + (rDTO == null));

				        if (rDTO == null) {
				            rDTO = new UserDTO();
				        }

				        log.info(this.getClass().getName() + ".getUser End!");

				        return rDTO;
				    }
				
				
				
				//마이페이지
				@RequestMapping(value="user/mypage")
				public String mypage(HttpServletRequest request, HttpServletResponse reponse, ModelMap model,
						HttpSession session) throws Exception {
					log.info("mypage start!");
					/*
					 * 마이페이지 회원정보 불러오는 세션시작
					 */
					 String user_no = CmmUtil.nvl((String) session.getAttribute("SS_USER_NO"));
					 String user_name = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME"));
					 
					 log.info("세션으로부터 받아온 회원번호 : " + user_no);
					 log.info("세션으로부터 받아온 닉네임 : " + user_name);
					 
					 /*
						 * 마이페이지 회원정보 불러오는 세션끝
						 */
					 
					 //user_no에 해당하는 스토리 가져오기위해 pDTO세팅
					 ImgDTO pDTO = new ImgDTO();
					 pDTO.setUser_no(user_no);
					 
						List<ImgDTO> rList = imgService.getImg();
						
						log.info("rList : null? " + rList==null);
						
						if (rList == null) {
							rList = new ArrayList<>();
						}

						for (ImgDTO rDTO : rList) {
							
							log.info("rDTO :" + rDTO.getSeq());
							log.info("rDTO :" + rDTO.getFull_file_info());
							log.info("rDTO :" + rDTO.getSave_file_name());
							log.info("rDTO :" + rDTO.getSave_file_path());
							log.info("rDTO :" + rDTO.getSave_folder_name());
						}

						model.addAttribute("rList", rList);
						
						 rList = null;

						log.info(this.getClass().getName() + ".getimg end!");
					 
					 
					 /*
					  * 스토리 시작
					  */
					 /* log.info("img 가져오기시작");
					 
					 log.info(this.getClass().getName() + "이미지 불러오기 start!");

						List<ImgDTO> rList = imgService.getImg();
						
						log.info("rList : null? " + rList==null);
						
						if (rList == null) {
							rList = new ArrayList<>();
						}

						for (ImgDTO rDTO : rList) {
							
							log.info("rDTO :" + rDTO.getSeq());
							log.info("rDTO :" + rDTO.getFull_file_info());
							log.info("rDTO :" + rDTO.getSave_file_name());
							log.info("rDTO :" + rDTO.getSave_file_path());
							log.info("rDTO :" + rDTO.getSave_folder_name());
						}

						model.addAttribute("rList", rList);
						
						 rList = null;

						log.info(this.getClass().getName() + ".getimg end!");

						 *스토리끝!  
						 */
						
						
					
					return "/user/mypage";
				}
				
		

	


}
