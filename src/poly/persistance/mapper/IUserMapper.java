package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface IUserMapper {

	//회원가입하기(회원정보 등록하기)
	int insertUserInfo(UserDTO pDTO) throws Exception;

	//이메일 중복체크
	UserDTO emailCheck(UserDTO email) throws Exception;

	//닉네임 중복체크
	UserDTO nameCheck(UserDTO user_name) throws Exception;
	
	//로그인
	UserDTO getLoginCheck(UserDTO pDTO) throws Exception;

	//회원정보 불러오기
	UserDTO getUserInfo(UserDTO pDTO) throws Exception;

	//비밀번호 변경용 회원정보 불러오기
	UserDTO pwcheckUserInfo(UserDTO pDTO) throws Exception;

	//비밀번호 변경
	int changePwd(UserDTO pDTO) throws Exception;

	//회원정보 수정
	int updUserInfo(UserDTO pDTO) throws Exception;

	//회원탈퇴
	int delUserInfo(UserDTO pDTO) throws Exception;

	//회원정보 ajax
	UserDTO getUserDetail(UserDTO pDTO);



}
