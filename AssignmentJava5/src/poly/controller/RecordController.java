package poly.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.entity.Record;
import poly.entity.Staff;

import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
@RequestMapping("/menu/")
public class RecordController {
	@Autowired
	SessionFactory factory;

	@Autowired
	JavaMailSender mailer;

	@RequestMapping("tt")
	public String tt(ModelMap model) {
		Session ss = factory.getCurrentSession();
		String hql = "SELECT r.staff.id,SUM(case when r.type =1 then 1 else 0 end),SUM(case when r.type=0 then 1 else 0 end)"
				+ " ,r.staff.fullname from Record r   GROUP BY r.staff.id,r.staff.fullname ";
		Query query = ss.createQuery(hql);
		List<Record> list = query.list();
		model.addAttribute("recordsgnttcn", list);
		return "menu/tt";
	}

	@RequestMapping("tt2")
	public String ttpbtt(ModelMap model) {
		Session ss = factory.getCurrentSession();
		String hql = "SELECT r.staff.depart.id,"
				+ "SUM(case when r.type =1 then 1 else 0 end),SUM(case when r.type=0 then 1 else 0 end)"
				+ " ,  r.staff.depart.name from Record r "
				+ "  GROUP BY r.staff.depart.id ,r.staff.depart.name order by r.staff.depart.id asc	";
		Query query = ss.createQuery(hql);
		List<Record> list = query.list();
		model.addAttribute("recordsttpb2", list);
		return "menu/tt";
	}
	// ghi nhÃ¡ÂºÂ­n thÃƒÂ nh tÃƒÂ­ch cÃƒÂ¡ nhÃƒÂ¢n cÃ¡Â»Â§a nhÃƒÂ¢n viÃƒÂªn
	/*
	 * @RequestMapping("gnttcn") public String gnttcn() { return "menu/gnttcn"; }
	 */

	@RequestMapping("gnttcn")
	public String listRecords(ModelMap model) {
		Session ss = factory.getCurrentSession();
		String hql = "SELECT r.staff.id,SUM(case when r.type =1 then 1 else 0 end),SUM(case when r.type=0 then 1 else 0 end)"
				+ " ,r.staff.fullname from Record r   GROUP BY r.staff.id,r.staff.fullname ";
		Query query = ss.createQuery(hql);
		List<Record> list = query.list();
		model.addAttribute("recordsgnttcn", list);
		return "menu/gnttcn";
	}

	@ModelAttribute("staffsRecord")
	public List<Staff> getStaffs() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Staff";
		Query query = session.createQuery(hql);
		List<Staff> list = query.list();
		return list;
	}

	@RequestMapping("addttcn")
	public String addttcn(ModelMap model) {
		model.addAttribute("recordsa", new Record());
		return "menu/addttcn";
	}

	@RequestMapping(value = "addttcn", method = RequestMethod.POST)
	public String insertttcn(ModelMap model, @Validated @ModelAttribute("recordsa") Record record,
			BindingResult errors) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {

			if (errors.hasErrors()) {
				model.addAttribute("message1", "Vui lòng điền đúng thông tin !");
			} else {
				model.addAttribute("message1", "Chúc mừng bạn đã nhập thành công !");
				long millis = System.currentTimeMillis();
				java.sql.Date date = new java.sql.Date(millis);
				LocalDateTime now = LocalDateTime.now();
				DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
				String formatDateTime = now.format(format);
				record.setDate(date);
				session.save(record);

				model.addAttribute("message",
						"Thêm mới thành công: " + record.getType() + " " + record.getReason() + "!");
				String hql = "FROM Staff E WHERE E.id = :employee_id";
				Query query = session.createQuery(hql);
				query.setParameter("employee_id", record.getStaff().getId());
				Staff results = (Staff) query.uniqueResult();
				String emailTo = "";

				emailTo += results.getEmail();
				try {
					String from1 = "quangtam10082000@gmail.com";
					// Táº¡o mail
					MimeMessage mail = mailer.createMimeMessage();
					// Sá»­ dá»¥ng lá»›p trá»£ giÃºp
					String ktt = record.getType() ? "Thành tích" : "Kỷ luật";
					MimeMessageHelper helper = new MimeMessageHelper(mail);
					helper.setFrom(from1, from1);
					helper.setTo(emailTo);
					helper.setReplyTo(from1, from1);
					helper.setSubject("Ghi nhận thành tích & kỷ luật của nhân viên: " + results.getFullname());
					helper.setText("Loại thành tích & kỷ luật: " + ktt + " ngày " + formatDateTime + " với lý do: "
							+ record.getReason(), true);
					// Gá»­i mail
					mailer.send(mail);
					t.commit();
					return "redirect:/menu/gnttcn.htm";
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}

		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Thêm mới thất bại !");
			e.printStackTrace();

		} finally {
			session.close();
		}
		return "menu/addttcn";
	}

	@RequestMapping("ttcn")
	public String ttcn(ModelMap model) {
		Session ss = factory.getCurrentSession();
		String hql = "SELECT r.staff.id,SUM(case when r.type =1 then 1 else 0 end),SUM(case when r.type=0 then 1 else 0 end)"
				+ ", r.staff.fullname from Record r  GROUP BY r.staff.id,r.staff.fullname order by r.staff.id asc	";
		Query query = ss.createQuery(hql);
		List<Record> list = query.list();
		model.addAttribute("recordsgnttcn", list);
		return "menu/ttcn";
	}

	@RequestMapping("ttpb")
	public String ttpb(ModelMap model) {
		Session ss = factory.getCurrentSession();
		String hql = "SELECT r.staff.depart.id,"
				+ "SUM(case when r.type =1 then 1 else 0 end),SUM(case when r.type=0 then 1 else 0 end)"
				+ " ,  r.staff.depart.name from Record r "
				+ "  GROUP BY r.staff.depart.id ,r.staff.depart.name order by r.staff.depart.id asc	";
		Query query = ss.createQuery(hql);
		List<Record> list = query.list();
		model.addAttribute("recordsgnttcn", list);
		return "menu/ttpb";
	}
}
