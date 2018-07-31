package kr.co.winthemovie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.winthemovie.service.UserService;
import kr.co.winthemovie.vo.UserVo;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinform() {
		return "user/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String joinbyemailform() {
		return "user/register_prev";
	}

	@RequestMapping(value = "/joinbyemail", method = RequestMethod.POST)
	public String joinbyemail(@ModelAttribute UserVo userVo) {

		userService.userJoin(userVo);
		return "user/login";
	}

	@ResponseBody
	@RequestMapping(value = "/joinbykakao", method = RequestMethod.POST)
	public boolean joinbykakao(@ModelAttribute UserVo userVo) {

		boolean result = false;
		if (userService.userJoin(userVo) != 0) {
			result = true;
		} else {
			result = false;
		}

		return result;
	}

	@RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public String loginform() {
		return "user/login";
	}

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public boolean login(@ModelAttribute UserVo userVo, HttpSession session) {
		boolean result = false;
		UserVo authUser = userService.login(userVo);
		System.out.println("usercontroller service 거쳐나옴"+authUser.toString());
		if (authUser != null) {
			System.out.println("들어옴");
			session.setAttribute("authUser", authUser);
			result = true;
			return result;
		} else {
			System.out.println("비밀번호 틀림");
			return result;
		}
	}

	@ResponseBody
	@RequestMapping(value = "/loginbykakao", method = RequestMethod.POST)
	public boolean loginbykakao(@ModelAttribute UserVo userVo, HttpSession session) {

		boolean result = false;
		UserVo authUser = userService.loginbysns(userVo);
		if (authUser != null) {
			result = true;
			session.setAttribute("authUser", authUser);
			return result;
		} else {
			return result;
		}
	}

	@ResponseBody
	@RequestMapping(value = "/emailcheck", method = RequestMethod.POST)
	public boolean emailcheck(String email) {
		System.out.println("YEAH"+email);

		boolean result = userService.emailcheck(email);
		return result;
	}

	public boolean emailcheckNaver(String email) {
		System.out.println("check "+email);
		boolean result = userService.emailcheck(email);
		System.out.println("YEAH"+email);
		return result;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}

}