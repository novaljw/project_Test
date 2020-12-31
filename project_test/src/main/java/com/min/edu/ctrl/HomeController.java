package com.min.edu.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String Home(String home) {
		System.out.println("전달받은 값"+home);
		return "home";
	}
	
}
