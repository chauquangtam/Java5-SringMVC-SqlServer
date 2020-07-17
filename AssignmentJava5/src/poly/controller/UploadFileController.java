package poly.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Transactional
@Controller
@RequestMapping("/uploadfile/")
public class UploadFileController {
	@Autowired
	ServletContext context;

	@RequestMapping("form")
	public String index(ModelMap model) {
		return "uploadfile/form";
	}

	@RequestMapping("apply")
	public String apply(ModelMap model, @RequestParam("fullname") String fullname, @RequestParam("cv") MultipartFile cv,
			@RequestParam("photo") MultipartFile photo) {
		if (photo.isEmpty() || cv.isEmpty()) {
			model.addAttribute("message", "Vui lÃ²ng chá»�n file !");
		} else {
			try {
				String photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));
				String cvPath = context.getRealPath("/images/" + cv.getOriginalFilename());
				cv.transferTo(new File(cvPath));
				model.addAttribute("photo_name", photo.getOriginalFilename());
				model.addAttribute("cv_name", cv.getOriginalFilename());
				model.addAttribute("cv_type", cv.getContentType());
				model.addAttribute("cv_size", cv.getSize());
				return "uploadfile/apply";
			} catch (Exception e) {
				model.addAttribute("message", "Lá»—i lÆ°u file !");
			}
		}
		return "uploadfile/form";
	}
}
