package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.ImgDTO;

@Mapper("ImgMapper")
public interface IImgMapper {

	//이미지 파일 업로드 DB저장
	void InsertImgInfo(ImgDTO pDTO) throws Exception;

	//이미지 불러오기
	List<ImgDTO> getImg() throws Exception;

	
	//이미지 상세
	ImgDTO getimgDetail(ImgDTO pDTO) throws Exception;

	//내 이미지 불러오기
	//가져올 값이 한개이상일때 List로 가져온다.
	List<ImgDTO> getMyImg(ImgDTO pDTO) throws Exception; 
	
	//이미지 게시판 수정
	void imgUpdate (ImgDTO pDTO) throws Exception;
	
	//이미지 게시판 삭제
	int deleteImg(ImgDTO pDTO) throws Exception;
	
	
	

}
