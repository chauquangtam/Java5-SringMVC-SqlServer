package poly.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;

import poly.entity.Depart;
import poly.entity.Staff;

import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
@RequestMapping("/menu/")
public class StaffController {
	@Autowired
	SessionFactory factory;
	Staff staff;
	@Autowired
	ServletContext context;

	@RequestMapping("qlnv")
	public String list(ModelMap model) {
		Session ss = factory.getCurrentSession();
		String hql = "FROM Staff";
		Query query = ss.createQuery(hql);
		List<Staff> list = query.list();
		model.addAttribute("staff", list);
		return "menu/qlnv";
	}

	@RequestMapping("delete/{id}")
	public String deleteqlnv(ModelMap model, @PathVariable("id") String id) {
		Session ss = factory.openSession();
		try {
			String hql = "delete from Staff where id=:id";
			Query query = ss.createQuery(hql);
			query.setParameter("id", id);
			String hql1 = "FROM Staff where  id = '" + id + "'";
			Query query1 = ss.createQuery(hql1);
			Staff list = (Staff) query1.uniqueResult();
			Transaction t = ss.beginTransaction();
			int s = query.executeUpdate();
			t.commit();
			if (s > 0) {
				model.addAttribute("message", "Xóa thành công nhân viên " + list.getFullname());
			} else {
				t.rollback();
			}
		} catch (Exception e) {
			model.addAttribute("message", "Xóa thất bại " + e.toString());
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return "redirect:/menu/qlnv.htm";
	}

	@RequestMapping("editqlnv/{id}")
	public String repairqlnv(ModelMap model, @PathVariable("id") String id) {
		Session ss = factory.getCurrentSession();
		staff = (Staff) ss.get(Staff.class, id);
		model.addAttribute("staff", staff);
		return "redirect:/menu/editqlnv.htm";
	}

	@RequestMapping("editqlnv")
	public String update(ModelMap model, HttpServletRequest request) {
		request.setAttribute("id", staff.getId());
		request.setAttribute("username", staff.getUsername());
		request.setAttribute("password", staff.getPassword());
		request.setAttribute("fullname", staff.getFullname());
		request.setAttribute("gender", staff.getGender());
		request.setAttribute("birthday", staff.getBirthday());
		request.setAttribute("photo", staff.getPhoto());
		request.setAttribute("email", staff.getEmail());
		request.setAttribute("phone", staff.getPhone());
		request.setAttribute("salary", staff.getSalary());
		request.setAttribute("notes", staff.getNotes());
		request.setAttribute("roles", staff.getRoles());
		request.setAttribute("departId", staff.getDepart().getName());
		model.addAttribute("staffs", new Staff());

		return "menu/editqlnv";
	}

//	,@RequestParam("photo")String photo
	@RequestMapping(value = "editqlnv", method = RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("staffs") Staff staff) {
		Session ss = factory.openSession();
		Transaction t = ss.beginTransaction();
		try {
			ss.update(staff);
//			if (photo.isEmpty()) {
//				model.addAttribute("message", "Vui lÃƒÂ²ng chÃ¡Â»ï¿½n file !");
//				String hql1 = "FROM Staff  where id  like :nameEmployee ";
//				Query query1 = ss.createQuery(hql1);
//				query1.setString("nameEmployee", "%" + staff.getId() + "%");
//				List<Staff> list = query1.list();
//				for(Staff staffs:list) {
//					staff.setPhoto(staffs.getPhoto());
//				}
//			}else {
//				ss.update(staff);
//			}

			t.commit();
			model.addAttribute("message", "Sửa thành công nhân viên: " + staff.getFullname());
			return "redirect:/menu/qlnv.htm";

		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Sửa thất bại nhân viên: " + staff.getFullname());
			e.printStackTrace();

		} finally {
			ss.close();
		}
		return "redirect:/menu/editqlnv.htm";
	}

	@RequestMapping("addqlnv")
	public String insert(ModelMap model) {
		model.addAttribute("staffsa2", new Staff());
		return "menu/addqlnv";
	}

	@ModelAttribute("departs")
	public List<Depart> getDeparts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Depart";
		Query query = session.createQuery(hql);
		List<Depart> list = query.list();
		return list;
	}

	@RequestMapping(value = "addqlnv", method = RequestMethod.POST)
	public String insert(ModelMap model, @Validated @ModelAttribute("staffsa2") Staff staff, BindingResult errors) throws IOException {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			if (errors.hasErrors()) {
				model.addAttribute("message1", "Vui lòng nhập đúng thông tin !");
			} else {
					try {
						session.save(staff);
						t.commit();
						model.addAttribute("message", "Thêm mới thành công nhân viên: " + staff.getFullname() + "' !");
						System.out.println("Đc !");
						return "redirect:/menu/qlnv.htm";
					
					} catch (Exception e) {
						System.out.println("Lỗi !");
						e.printStackTrace();
					}
			}

		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "ThÃªm má»›i tháº¥t báº¡i !");
			e.printStackTrace();

		} finally {
			session.close();
		}
		return "menu/addqlnv";
	}

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String searchQLNV(ModelMap model, @RequestParam("nameEmployee") String nameEmployee, HttpSession httpSession,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		Session ss = factory.openSession();
		Transaction t = ss.beginTransaction();
		try {
			String hql1 = "FROM Staff  where fullname  like :nameEmployee ";
			Query query1 = ss.createQuery(hql1);
			query1.setString("nameEmployee", "%" + nameEmployee + "%");
			List<Staff> list = query1.list();
			httpSession.setAttribute("request", nameEmployee);
			model.addAttribute("searchName", list);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return "menu/qlnvSearch";
	}

}
