package poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class AdminController {
	@RequestMapping("/home/index")
	public String index() {
	return "home/index";
	}
	@RequestMapping("/home/about")
	public String homeAbout() {
	return "home/about";
	}
	@RequestMapping("/admin/about")
	public String about() {
	return "admin/about";
	}
	@RequestMapping("/blank/contact")
	public String contact() {
	return "blank/contact";
	}

}
