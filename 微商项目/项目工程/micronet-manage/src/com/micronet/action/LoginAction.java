package com.micronet.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginAction {

	@RequestMapping("/login.html")
	public String login(){
		return "login";
	}
	@RequestMapping("/register.html")
	public String register(){
		return "register";
	}
}
