package com.micronet.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class IndexAction {

	@RequestMapping("/index.html")
	public String index(){
		return "index";
	}
	
	@RequestMapping("/errer.html")
	public String errer(){
		return "index";
	}
}
