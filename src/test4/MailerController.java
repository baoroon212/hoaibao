package test4;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.entity.DonHang;



@Controller
public class MailerController {
	
	@Autowired
	JavaMailSender mailer;
	@Autowired
	SessionFactory factory;
	@RequestMapping("send")
	public String send(ModelMap model,
			@ModelAttribute("donhang") DonHang donhang,BindingResult error) {
		try {
			Session session1 = factory.openSession();
			String hql = "FROM DonHang";
			Query query = session1.createQuery(hql);
			List<DonHang> list = query.list();
			DonHang donhang1 = new DonHang();
			for (DonHang obj : list) {
	             donhang1=obj; 
	        }
			int madonhang = donhang1.getMadonhang()+1;
			donhang.setMadonhang(madonhang);
			float tongtien = donhang.getSoluong() * donhang.getTongtien();
			donhang.setTongtien(tongtien);
			//Tao mail
			String from ="baoroon212@gmail.com";
			String to =donhang.getEmail();
			String subject ="Xác nhận đơn hàng SeaFood.";
			String body ="Chào "+donhang.getHoten()+"! Bạn vui lòng nhập mã xác nhận : "+donhang.getMadonhang()+" để xác nhận mua.Sản phẩm " +donhang.getTensanpham()+" Số lượng : "+donhang.getSoluong()+"KG Giá: " +donhang.getTongtien();
			MimeMessage mail = mailer.createMimeMessage();
			//Su dung lop tro giup
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom(from,from);
			helper.setTo(to);
			helper.setReplyTo(from,from);
			helper.setSubject(subject);
			helper.setText(body,true);
			
			//gui mail
			mailer.send(mail);
			model.addAttribute("donhang", donhang);
			model.addAttribute("message","Gui mail thanh cong!");
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("message","Gui mail that bai!");
		}
		return "order/checkorder";
	}
	
}
