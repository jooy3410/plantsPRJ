package poly.service;

import java.util.List;

import poly.dto.ImgDTO;

public interface IImgService {

	//이미지 업로드
	ImgDTO uploadImg(ImgDTO pDTO)throws Exception;

	//이미지 불러오기
	List<ImgDTO> getImg() throws Exception;

	//이미지 상세페이지 불러오기
	ImgDTO getimgDetail(ImgDTO pDTO) throws Exception;
	
	//내 이미지 불러오기
	//가져올 값이 한개이상일때 List로 가져온다.
	List<ImgDTO> getMyImg(ImgDTO pDTO) throws Exception; 
//getMyImg(ImgDTO pDTO)요청할 회원정보값을 가지고 간다.
	
	//이미지게시판 업데이트
	void imgUpdate(ImgDTO pDTO) throws Exception;
	//ImgDTO리턴값을 받는자리
	//정보를 가지고올때는 셀렉트 와 같은 것은 DTO나 List 형태로 받고
	// int를 사용하는 경우는 성공여부를 1또는 0으로 할때 인트로 받는다
	// (int 사용 : 데이터값을 받지는 않고 그냥 성공여부 데이터 insert, update, delete)
	
	//루틴삭제
	int deleteImg(ImgDTO pDTO) throws Exception;

	

}
