package poly.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.entity.Staff;


@Transactional
@Controller
@RequestMapping("loginandregistration")
public class LoginAndRegistrationController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("registration")
	public String registration() {
		return "loginandregistration/registration";
	}

	@RequestMapping("login")
	public String login(ModelMap model) {
		model.addAttribute("staffs", new Staff());
		return "loginandregistration/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(ModelMap model, @RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession httpSession) {
		Session session = factory.getCurrentSession();
		try {
			 String hql = "FROM Staff where  username = '" + username + "'";
			 Query query =session.createQuery(hql); 
			 Staff user = (Staff)query.uniqueResult();
//			 System.out.println("id nháº­p: "+username);
//			 System.out.println("id er: "+user.getUsername());
			/*Staff user = (Staff) session.get(Staff.class, username);*/
			if (!user.getPassword().equals(password)) {
				model.addAttribute("message", "Sai máº­t kháº©u");
			} else {
				httpSession.setAttribute("user", user);
				model.addAttribute("message", "Ä�Äƒng nháº­p thÃ nh cÃ´ng");
				return "redirect:/home/index.htm";
			}
		} catch (Exception e) {
			model.addAttribute("message", "Sai tÃªn Ä‘Äƒng nháº­p");
	
		}
		return "loginandregistration/login";
	}
	
	@RequestMapping(value = "/dangxuat",method = RequestMethod.GET)
	public String logout(HttpSession session,HttpServletRequest request) {
		session.removeAttribute("user");
		return "redirect:/home/index.htm";

	}
}
