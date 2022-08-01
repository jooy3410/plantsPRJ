package poly.service;

import poly.dto.UserDTO;

public interface IUserService {

	//회원가입하기(회원정보 등록하기)
	int insertUserInfo(UserDTO pDTO) throws Exception;

	//이메일 중복확인
	UserDTO emailCheck(UserDTO pDTO) throws Exception;

	//닉네임 중복 방지
	UserDTO nameCheck(UserDTO pDTO) throws Exception;

	//로그인
	int getLoginCheck(UserDTO pDTO) throws Exception;

	//회원정보 불러오기
	UserDTO getUserInfo(UserDTO pDTO) throws Exception;

	//비밀번호 변경용 회원정보 불러오기
	UserDTO pwcheckUserInfo(UserDTO pDTO) throws Exception;

	//비밀번호 찾기용 인증번호 생성
	String certNumber() throws Exception;

	//비밀번호 변경
	int changePwd(UserDTO pDTO) throws Exception;

	//회원정보 수정
	int updUserInfo(UserDTO pDTO) throws Exception;

	//회원탈퇴
	int delUserInfo(UserDTO pDTO) throws Exception;

	//회원 번호ajax
	UserDTO getUserDetail(UserDTO pDTO) throws Exception;
 
}
