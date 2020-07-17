package poly.controller;

import java.util.List;

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

import poly.entity.Record;
import poly.entity.Staff;

@Transactional
@Controller
@RequestMapping("/home/")
public class FormController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("index")
	public String recordIndex(ModelMap model) {
		Session ss = factory.getCurrentSession();
		String hql = "SELECT r.staff.fullname	,r.staff.photo,r.staff.depart.name, "
				+ " SUM(case when r.type=1 then 1 else 0 end)- " + " SUM(case when r.type=0 then 1 else 0 end) as t"
				+ " FROM Record r "
				+ " GROUP BY r.staff.fullname	,r.staff.photo,r.staff.depart.name  order by t desc   ";
		Query query = ss.createQuery(hql);
		query.setMaxResults(10);
		List<Record> list = query.list();
		model.addAttribute("indexlist", list);
		return "home/index";
	}
	
}
