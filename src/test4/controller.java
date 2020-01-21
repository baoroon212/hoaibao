package test4;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


import poly.entity.Admin;
import poly.entity.Ca;
import poly.entity.CuaGhe;
import poly.entity.DonHang;
import poly.entity.Tom;


@Transactional
@Controller
public class controller {
	@Autowired
	SessionFactory factory;
	
	
	@RequestMapping("trang-chu")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Tom";
		Query query = session.createQuery(hql);
		List<Tom> list = query.list();
		model.addAttribute("tom", list);
		
		
	    hql = "FROM Ca";
		query = session.createQuery(hql);
		List<Ca> list2 = query.list();
		model.addAttribute("ca", list2);
		
		hql = "FROM CuaGhe";
		query = session.createQuery(hql);
		List<CuaGhe> list3 = query.list();
		model.addAttribute("cuaghe", list3);
		
		return "shop";
	}
	
	@RequestMapping("trang-tom")
	public String shoptom(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Tom";
		Query query = session.createQuery(hql);
		List<CuaGhe> list = query.list();
		model.addAttribute("tom", list);
		
		return "shoptom/shoptom";
	}
	
	@RequestMapping("trang-ca")
	public String shopca(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Ca";
		Query query = session.createQuery(hql);
		List<Ca> list = query.list();
		model.addAttribute("ca", list);
		
		return "shopca/shopca";
	}
	
	@RequestMapping("trang-cua-ghe")
	public String shopcua(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM CuaGhe";
		Query query = session.createQuery(hql);
		List<CuaGhe> list = query.list();
		model.addAttribute("cuaghe", list);
		
		return "shopcua/shopcua";
	}
	
	@RequestMapping("order")
	public String order() {
		return "order/order";
	}
	@RequestMapping("edit1/{masanpham}")
	public String edit1(ModelMap model,
						@PathVariable("masanpham")int tensanpham) {
		Session session = factory.getCurrentSession();
		Tom tom = (Tom) session.get(Tom.class,tensanpham);
		CuaGhe cuaghe = (CuaGhe) session.get(CuaGhe.class,tensanpham);
		Ca ca = (Ca) session.get(Ca.class,tensanpham);
		if(tom==null&&cuaghe==null)
		{
			model.addAttribute("sanpham", ca);
		}
		else if(tom==null&&ca==null)
		{
			model.addAttribute("sanpham", cuaghe);
		}
		else if(cuaghe==null&&ca==null)
		{
			model.addAttribute("sanpham", tom);
		}
		return "order/order1";
	}
	
	@RequestMapping("edit/{masanpham}")
	public String edit(ModelMap model,
						@PathVariable("masanpham")int tensanpham) {
		Session session = factory.getCurrentSession();
		Tom tom = (Tom) session.get(Tom.class,tensanpham);
		CuaGhe cuaghe = (CuaGhe) session.get(CuaGhe.class,tensanpham);
		Ca ca = (Ca) session.get(Ca.class,tensanpham);
		DonHang donhang = new DonHang();
		Session session1 = factory.openSession();
		if(tom==null&&cuaghe==null)
		{
			String hql = "FROM DonHang";
			Query query = session1.createQuery(hql);
			List<DonHang> list = query.list();
			DonHang donhang1 = new DonHang();
			for (DonHang obj : list) {
	             donhang1=obj; 
	        }
			int madonhang = donhang1.getMadonhang()+1;
			donhang.setMadonhang(madonhang);
			donhang.setTensanpham(ca.getTensanpham());
			donhang.setMasanpham(ca.getMasanpham());
			donhang.setTongtien(ca.getGiagoc());
			model.addAttribute("sanpham", ca);
			model.addAttribute("donhang", donhang);
		}
		else if(tom==null&&ca==null)
		{

			String hql = "FROM DonHang";
			Query query = session1.createQuery(hql);
			List<DonHang> list = query.list();
			DonHang donhang2 = new DonHang();
			for (DonHang obj : list) {
	             donhang2=obj; 
	        }
			int madonhang1 = donhang2.getMadonhang()+1;
			donhang.setMadonhang(madonhang1);
			donhang.setTensanpham(cuaghe.getTensanpham());
			donhang.setMasanpham(cuaghe.getMasanpham());
			donhang.setTongtien(cuaghe.getGiagoc());
			model.addAttribute("sanpham", cuaghe);
			model.addAttribute("donhang", donhang);
		}
		else if(cuaghe==null&&ca==null)
		{

			String hql = "FROM DonHang";
			Query query = session1.createQuery(hql);
			List<DonHang> list = query.list();
			DonHang donhang3 = new DonHang();
			for (DonHang obj : list) {
	             donhang3=obj; 
	        }
			int madonhang2 = donhang3.getMadonhang()+1;
			donhang.setMadonhang(madonhang2);
			donhang.setTensanpham(tom.getTensanpham());
			donhang.setMasanpham(tom.getMasanpham());
			donhang.setTongtien(tom.getGiagoc());
			model.addAttribute("sanpham", tom);
			model.addAttribute("donhang", donhang);
		}
		return "order/order";
	}
	
	public  List<Tom> listgh = new ArrayList<Tom>();
	
	@RequestMapping(value = "giohang",method = RequestMethod.POST)
	public String giohang(ModelMap model,
			@ModelAttribute("sanpham") Tom donhang,BindingResult error)
			{
			int msp = donhang.getMasanpham();
			for (Tom obj : listgh) {
				if(msp == obj.getMasanpham())
				{	
						return "redirect:/trang-gio-hang.htm";
				} 
			}
			 listgh.add(donhang);
		return "redirect:/trang-gio-hang.htm";
	}
	
	@RequestMapping("deletegiohang/{masanpham}")
	public String delete(ModelMap model,
						@PathVariable("masanpham")String madonhang) {
		int msp = Integer.parseInt(madonhang);
		for (Tom obj : listgh) {
			if(msp == obj.getMasanpham())
			{	
				listgh.remove(obj);
				return "redirect:/trang-gio-hang.htm";
			} 
		}
		return "redirect:/trang-gio-hang.htm";
	}
	
	@RequestMapping("trang-gio-hang")
	public String tranggiohang(ModelMap model) {

		model.addAttribute("sanpham", listgh);
		
		return "giohang/giohang";
	}

	
	@RequestMapping(value = "checkorder",method = RequestMethod.POST)
	public String checkorder(ModelMap model,
			@ModelAttribute("donhang") DonHang donhang,BindingResult error,HttpServletRequest request)
			{
			String check = request.getParameter("check");
			String mdh=String.valueOf(donhang.getMadonhang()); 
			if(check.equals(mdh))
			{
				Session session = factory.openSession();

				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				Date date = new Date();
				String dateFormat = formatter.format(date);
				donhang.setNgaydathang(dateFormat);
				Transaction t = session.beginTransaction();
				
				try {
					session.save(donhang);
					t.commit();
					model.addAttribute("message", " Đặt hàng thành công!");	
					int msp = donhang.getMasanpham();
					for (Tom obj : listgh) {
						if(msp == obj.getMasanpham())
						{	
							listgh.remove(obj);
							model.addAttribute("message", " Đặt hàng thành công!");		
						} 
						return "order/ordersuccess";
					}
				}catch (Exception e) {
					t.rollback();
					model.addAttribute("message", "Đặt hàng thất bại!");
				}finally {
					session.close();
				}
			}
			else {
				model.addAttribute("message", "Vui lòng kiểm tra lại mã xác nhận!");
				return "order/checkorder";
			}
		return "order/ordersuccess";
	}
	
	@RequestMapping("shop")
	public String home() {
		return "shop";
	}
}
