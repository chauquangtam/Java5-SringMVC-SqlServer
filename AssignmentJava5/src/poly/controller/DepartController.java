package poly.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.entity.Depart;
import poly.entity.Staff;

import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
@RequestMapping("/menu/")
public class DepartController {
	@Autowired
	SessionFactory factory;

	Depart depart;

	@RequestMapping("qlpb")
	public String listqlpb(ModelMap model) {
		Session ss = factory.getCurrentSession();
		String hql = "FROM Depart";
		Query query = ss.createQuery(hql);
		List<Depart> list = query.list();
		model.addAttribute("departs", list);
		return "menu/qlpb";
	}

	@RequestMapping("deleteqlpb/{id}")
	public String deleteqlpb(ModelMap model, @PathVariable("id") String id) {
		Session ss = factory.openSession();
		try {
			String hql = "delete from Depart where id=:id";
			Query query = ss.createQuery(hql);
			query.setParameter("id", id);
			String hql1 = "FROM Depart where  id = '" + id + "'";
			Query query1 = ss.createQuery(hql1);
			Depart list = (Depart) query1.uniqueResult();
			Transaction t = ss.beginTransaction();
			int s = query.executeUpdate();
			t.commit();
			if (s > 0) {
				model.addAttribute("message", "XÃ³a thÃ nh cÃ´ng: " + list.getName());
			} else {
				t.rollback();
			}
		} catch (Exception e) {
			model.addAttribute("message", "XÃ³a tháº¥t báº¡i: " + e.toString());
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return "redirect:/menu/qlpb.htm";
	}

	@RequestMapping("addpb")
	public String addpb(ModelMap model) {
		model.addAttribute("departsa", new Depart());
		return "menu/addpb";
	}

	@RequestMapping(value = "addpb", method = RequestMethod.POST)
	public String addpb(ModelMap model, @Validated @ModelAttribute("departsa") Depart depart, BindingResult errors) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			if (errors.hasErrors()) {
				model.addAttribute("message1", "Vui lòng sửa các lỗi sau đây !");
			} else {
				model.addAttribute("message1", "Chúc mừng, bạn đã nhập đúng !");
				session.save(depart);
				t.commit();

				model.addAttribute("message", "ThÃªm má»›i thÃ nh cÃ´ng : " + depart.getName() + "' !");
				return "redirect:/menu/qlpb.htm";
			}

		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "ThÃªm má»›i tháº¥t báº¡i !");

		} finally {
			session.close();
		}
		return "menu/addpb";
	}

	@RequestMapping("editpb/{id}")
	public String editpb(ModelMap model, @PathVariable("id") String id) {
		Session ss = factory.getCurrentSession();
		depart = (Depart) ss.get(Depart.class, id);
		model.addAttribute("departedit", depart);

		return "redirect:/menu/editpb.htm";

	}

	@RequestMapping("editpb")
	public String editpb(ModelMap model, HttpServletRequest request) {
		request.setAttribute("rename", depart.getName());
		request.setAttribute("idname", depart.getId());
		model.addAttribute("departscheckedit", new Depart());

		return "menu/editpb";
	}

	@RequestMapping(value = "editpb", method = RequestMethod.POST)
	public String editpb(ModelMap model, @Validated @ModelAttribute("departscheckedit") Depart depart,
			BindingResult errors) {
		Session ss = factory.openSession();
		Transaction t = ss.beginTransaction();

		try {
			if (errors.hasErrors()) {
				model.addAttribute("message1", "Vui lòng sửa các lỗi sau đây !");
			} else {
				model.addAttribute("message1", "Chúc mừng, bạn đã nhập đúng !");
				ss.update(depart);
				t.commit();
				model.addAttribute("message", "Sá»­a thÃ nh cÃ´ng: " + depart.getName());
				return "redirect:/menu/qlpb.htm";
			}
			
			

		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Sá»­a tháº¥t báº¡i: " + depart.getName());
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return "menu/editpb";
	}

}
