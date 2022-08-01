package poly.service;

import java.util.List;

import poly.dto.ImgDTO;
import poly.dto.MailDTO;

public interface IMailService {
	
	// 메일 발송
	int doSendMail(MailDTO pDTO);

	

}
