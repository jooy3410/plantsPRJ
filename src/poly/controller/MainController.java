package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="index")
	public String Index() {
		log.info(this.getClass());
		log.info("메인페이지");
		return "/index";
	}
	
	@RequestMapping(value="img/scroll")
	public String scroll() {
		log.info(this.getClass());
		log.info("메인페이지");
		return "/img/scroll";
	}

	@RequestMapping(value="test")
	public String test() {
		
		log.info("test");
		
		return "/test";
	}
	
	@RequestMapping(value="chili_view")
	public String chili_view() {
		
		log.info("chili_view");
		
		return "/chili_view";
	}
	
	@RequestMapping(value="tomato_view")
	public String tomato_view() {
		
		log.info("tomato_view");
		
		return "/tomato_view";
	}
	
	@RequestMapping(value="cucumber_view")
	public String cucumber_view() {
		
		log.info("cucumber_view");
		
		return "/cucumber_view";
	}
	
	@RequestMapping(value="test2")
	public String test2() {
		
		log.info("test2");
		
		return "/test2";
	}
}
