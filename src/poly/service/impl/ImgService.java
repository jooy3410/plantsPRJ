package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.ImgDTO;
import poly.persistance.mapper.IImgMapper;
import poly.service.IImgService;

@Service("ImgService")
public class ImgService implements IImgService {
	
	//로그 파일 생성 및 로그 출력을 위한 log4j 프레이무어크의 자바 객체
	private Logger log = Logger.getLogger(this.getClass());
	
	/*
	 * 이미지 파일로 부터 문자 읽어오기
	 * 
	 * @param pDTO 이미지 파일 정보
	 * @return pDTO 이미지로 부터 읽은 문자열
	 */

	
	@Resource(name = "ImgMapper")
	private IImgMapper imgMapper;
	
	
	//이미지 업로드 저장
	@Override
	public ImgDTO uploadImg(ImgDTO pDTO) throws Exception {
		
		log.info(this.getClass().getName() + ".uploadImg start!!");
		
		imgMapper.InsertImgInfo(pDTO);
		
		log.info(this.getClass().getName() + ".getOcrInfoFromWEB START!!");
		
		return pDTO;
	}


	//이미지 리스트 불러오기
	@Override
	public List<ImgDTO> getImg() throws Exception {
		return imgMapper.getImg();
	}

	//이미지 상세페이지
	@Override
	public ImgDTO getimgDetail(ImgDTO pDTO) throws Exception {
		
		return imgMapper.getimgDetail(pDTO);
	}


	// 내 이미지 불러오기
	@Override
	public List<ImgDTO> getMyImg(ImgDTO pDTO) throws Exception {
		
		return imgMapper.getMyImg(pDTO);
	}


	// 이미지게시판 수정
	@Override
	public void imgUpdate(ImgDTO pDTO) throws Exception {
		
		// return 값이 없는 경우(void)의 경우는 return 매퍼.함수명을 안 씀
		// 그냥 imgMapper.imgUpdate(pDTO); 이런식으로 사용
		imgMapper.imgUpdate(pDTO);
	}


	//이미지 삭제
	@Override
	public int deleteImg(ImgDTO pDTO) throws Exception {
		
		return imgMapper.deleteImg(pDTO);
	}
	
	




}
