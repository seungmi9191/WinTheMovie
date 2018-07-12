package kr.co.winthemovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/mypage")
public class MyPageController {
	
	// 마이페이지 인포 페이지
	@RequestMapping(value="/myinfo", method=RequestMethod.GET)
	public String myinfoform() {
		return "user/";
	}
	// 예매내역 페이지
	@RequestMapping(value="/myticket", method=RequestMethod.GET)
	public String myticketform() {
		return "user/";
	}
	// 1:1  문의 페이지
	@RequestMapping(value="/contact", method=RequestMethod.GET)
	public String contactform() {
		return "user/contact";
	}
	
	// 공지사항 페이지
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String noticeform() {
		return "user/notice";
	}
	
	// 자주묻는 질문 페이지
	@RequestMapping(value="/faq", method=RequestMethod.GET)
	public String faqform() {
		return "user/faq";
	}
	
	// 이용약관 페이지
	@RequestMapping(value="/agreement", method=RequestMethod.GET)
	public String agreementform() {
		return "user/agreement";
	}
	
	// 이메일 보내기 기능
	@RequestMapping(value="/emailsending", method=RequestMethod.POST)
	public String emailSending() {
		String emailId = "bitwinthemovie@gmail.com";
		String name = "";
		String title = "";
		String tomail = "";
		String phone = "";
		String content = "";
		
		return "redirect:/mypage/contact.jsp";
	}
}
