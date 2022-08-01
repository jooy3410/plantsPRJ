package poly.service.impl;

import java.util.Random;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.MailDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.IUserMapper;
import poly.service.IMailService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

@Service("UserService")
public class UserService implements IUserService{
	
	@Resource(name="UserMapper")
	private IUserMapper userMapper;
	
	
	private Logger log = Logger.getLogger(this.getClass());

	// 회원가입 DB저장
	@Override
	public int insertUserInfo(UserDTO pDTO) throws Exception {
		log.info(this.getClass().getName() + " insertUserInfo 시작");
		
		return userMapper.insertUserInfo(pDTO);

	}
	
	
	//회원가입 email 중복체크
		@Override
		public UserDTO emailCheck(UserDTO email) throws Exception {
			return userMapper.emailCheck(email);
		}

		
		@Override
		public UserDTO nameCheck(UserDTO user_name) throws Exception {
			// TODO Auto-generated method stub
			return userMapper.nameCheck(user_name);
		}
		
		
	

	/**
	 * 로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기
	 * 
	 */
	@Override
	public int getLoginCheck(UserDTO pDTO) throws Exception {
		
		log.info("getUserLoginCheck시작!");
		//로그인 성공 : 1, 실패 : 0
		int res = 0;
		
		//로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기 위한 mapper 호출하기
		UserDTO rDTO = userMapper.getLoginCheck(pDTO);
		
		if (rDTO == null) {
			rDTO = new UserDTO();
		}
		/*
		 * ###############
		 * 로그인 성공여부 시작
		 * ###############
		 */
		
		/*
		 * userMapper로 부터 select 쿼리의 결과로 회원아이디를 받아왔다면, 로그인성공
		 * 
		 * DTO의 변수에 값이 있느지 확인하기 처리속도 측면에서 가장 좋은 방법은 변수의 길이를 가져오는 것
		 * 따라서  .length() 함수를 통해 회원아이디의 글자수를 가져와 0보다 큰지 비교한다.
		 * 0보다 크면, 글자가 존재하는 것이기 떄문에 값이 존재한다.
		 */
		
		if (CmmUtil.nvl(rDTO.getEmail()).length()>0) {
			res = 1;
			
		}
		/*
		 * ####################################
		 * 로그인 성공 여부 체크 끝!
		 * ####################################
		 */
		
		return res;
	}


	//회원정보 불러오기
	@Override
	public UserDTO getUserInfo(UserDTO pDTO) throws Exception {
		
		return userMapper.getUserInfo(pDTO);
	}


	@Override
	public UserDTO pwcheckUserInfo(UserDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.pwcheckUserInfo(pDTO);
	}


	@Override
	public String certNumber() throws Exception {
		Random ran = new Random();

		String str;

		String value = "";

		for (int i = 0; i < 6; i++) {
			if (ran.nextBoolean()) {
				// A-Z
				str = String.valueOf((char) ((ran.nextInt(26)) + 65));
				value = value + str;
				continue;
			} else {
				// 0-9
				str = String.valueOf(ran.nextInt(10));
				value = value + str;
				continue;
			}

		}

		return value;
	}


	//비밀번호 변경
	@Override
	public int changePwd(UserDTO pDTO) throws Exception {


		int res = 0;

		int success = userMapper.changePwd(pDTO);

		if (success > 0) {
			res = 1;
		} else {
			res = 0;
		}
		return res;
	}


	//회원정보 수정
	@Override
	public int updUserInfo(UserDTO pDTO) throws Exception {
		int res = 0;

		int success = userMapper.updUserInfo(pDTO);

		if (success > 0) {
			res = 1;
		} else {
			res = 0;
		}
		return res;
	}


	@Override
	public int delUserInfo(UserDTO pDTO) throws Exception {
		int res = 0;

		int success = userMapper.delUserInfo(pDTO);

		if (success > 0) {
			res = 1;
		} else {
			res = 0;
		}
		
		return res;
	}


	@Override
	public UserDTO getUserDetail(UserDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		 return userMapper.getUserDetail(pDTO);
	}



	
	

}
