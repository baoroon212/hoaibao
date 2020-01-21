package test4;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.entity.Admin;
import poly.entity.Ca;
import poly.entity.CuaGhe;
import poly.entity.DonHang;
import poly.entity.Tom;






@Transactional
@Controller
@RequestMapping("/admin/")
public class admincontroller {
	

	@Autowired
	SessionFactory factory;
	Admin admin = new Admin();
	@RequestMapping("checkadmin")
	public String checkorder(ModelMap model,@ModelAttribute("user") Admin ad1,HttpServletRequest request)
			{
			String user = ad1.getUsername();
			String password = ad1.getPassword();
			Session session = factory.getCurrentSession();
			String hql = "FROM Admin";
			Query query = session.createQuery(hql);
			List<Admin> list = query.list();
			Admin ad = new Admin();
			for (Admin obj : list) {
	             ad=obj; 
	        }
			if(user.equals(ad.getUsername())&&password.equals(ad.getPassword()))
			{
					admin = ad1;
					model.addAttribute("message", "Đăng nhập thành công!");
					HttpSession session5 = request.getSession();
					session5.setAttribute("user", ad1);
					return"redirect:/admin/query.htm";
			}
			else {
				model.addAttribute("message", "Đăng nhập thất bại!");
				return"admin/login";
			}
			}
	
	@RequestMapping("out")
	public String out(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		admin.setUsername("");
		admin.setPassword("");
		model.addAttribute("user", admin);
		session.removeAttribute("user");
		return"admin/login";
	}
	
		@RequestMapping("query")
		public String index(ModelMap model) {
			Session session = factory.getCurrentSession();
			String hql = "FROM DonHang";				
			Query query1 = session.createQuery(hql);
			List<DonHang> listdh = query1.list();
			model.addAttribute("donhang", listdh);
			
			return "admin/adminpage";
		}
		
		@RequestMapping("delete/{madonhang}")
		public String delete(ModelMap model,
							@PathVariable("madonhang")String madonhang) {
			int mdh = Integer.parseInt(madonhang);
			Session session = factory.openSession();
			DonHang donhang = (DonHang) session.get(DonHang.class,mdh);
			Transaction t = session.beginTransaction();
			
			try {
				session.delete(donhang);
				t.commit();
				model.addAttribute("message", "Delete thành công");
			}catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Delete thất bại!");
			}finally {
				session.close();
			}
			
			return "redirect:/admin/query.htm";
		}
		
		@RequestMapping("trang-chu-sp")
		public String index1(ModelMap model) {
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
			
			return "admin/qlsanpham";
		}
		
		
		@RequestMapping("deletesp/{masanpham}")
		public String deletesp(ModelMap model,
							@PathVariable("masanpham")int msp) {
			Session session = factory.openSession();
			if(msp<20)
			{
				Tom donhang = (Tom) session.get(Tom.class,msp);
				Transaction t = session.beginTransaction();
				File file = new File("C:\\Users\\ADMIN\\eclipse-workspace\\test4\\WebContent\\"+donhang.getHinhanh());
	            if (file.delete()) {
	                System.out.println(file.getName() + " is deleted!");
	                try {
						session.delete(donhang);
						t.commit();
						model.addAttribute("message", "Delete thành công");
					}catch (Exception e) {
						t.rollback();
						model.addAttribute("message", "Delete thất bại!");
					}finally {
						session.close();
					}
					
					return "redirect:/admin/qlsanpham";
	            } else {
	                System.out.println("Xóa thất bại.");
	            }
				
			}
			else if(20<=msp&&msp<40)
			{
				CuaGhe donhang = (CuaGhe) session.get(CuaGhe.class,msp);
				Transaction t = session.beginTransaction();
				File file = new File("C:\\Users\\ADMIN\\eclipse-workspace\\test4\\WebContent\\"+donhang.getHinhanh());
	            if (file.delete()) {
	                System.out.println(file.getName() + " is deleted!");
	            } else {
	                System.out.println("Xóa thất bại.");
	            }
				try {
					session.delete(donhang);
					t.commit();
					model.addAttribute("message", "Delete thành công");
				}catch (Exception e) {
					t.rollback();
					model.addAttribute("message", "Delete thất bại!");
				}finally {
					session.close();
				}
				
				return "redirect:/admin/trang-chu-sp.htm";
			}
			else if(msp>=40)
			{
				Ca donhang = (Ca) session.get(Ca.class,msp);
				Transaction t = session.beginTransaction();
				File file = new File("C:\\Users\\ADMIN\\eclipse-workspace\\test4\\WebContent\\"+donhang.getHinhanh());
	            if (file.delete()) {
	                System.out.println(file.getName() + " is deleted!");
	            } else {
	                System.out.println("Xóa thất bại.");
	            }
				try {
					session.delete(donhang);
					t.commit();
					model.addAttribute("message", "Delete thành công");
				}catch (Exception e) {
					t.rollback();
					model.addAttribute("message", "Delete thất bại!");
				}finally {
					session.close();
				}
				
				return "redirect:/admin/trang-chu-sp.htm";
			}
			return "redirect:/admin/trang-chu-sp.htm";
		}
		
		@RequestMapping("editsp/{masanpham}")
		public String editsp(ModelMap model,
							@PathVariable("masanpham")int msp) {
			if(msp<20)
			{
				Session session = factory.getCurrentSession();
				Tom sp = (Tom) session.get(Tom.class,msp);
				
				model.addAttribute("sp", sp);
				return "admin/edit";
			}
			else if(20<=msp&&msp<40)
			{
				Session session = factory.getCurrentSession();
				CuaGhe sp = (CuaGhe) session.get(CuaGhe.class,msp);
				
				model.addAttribute("sp", sp);
				return "admin/edit";
			}
			else if(msp>=40)
			{
				Session session = factory.getCurrentSession();
				Ca sp = (Ca) session.get(Ca.class,msp);
				
				model.addAttribute("sp", sp);
				return "admin/edit";
			}
			
			return "admin/edit";
		}
		
		@RequestMapping(value="editsp2", method = RequestMethod.POST)
		public String insert2(ModelMap model,
							@ModelAttribute("sp") Tom tom,
							HttpServletRequest request) {
							if(tom.getMasanpham()<20)
							{
								Session session = factory.openSession();
								Tom sp = (Tom) session.get(Tom.class,tom.getMasanpham());
								Transaction t = session.beginTransaction();
								
								try {
								String masanpham = request.getParameter("masanpham");
								int msp = Integer.parseInt( masanpham);
								String tensanpham = request.getParameter("tensanpham");
								String hinhanh = request.getParameter("hinhanh");
								String motangan = request.getParameter("motangan");
								String giagoc =request.getParameter("giagoc");
								float ggoc = Float.parseFloat(giagoc);								
								
								sp.setMasanpham(msp);
								sp.setTensanpham(tensanpham);
								sp.setHinhanh(hinhanh);
								sp.setMotangan(motangan);
								sp.setGiagoc(ggoc);
							
								
								session.update(sp);
								t.commit();
								model.addAttribute("message", "Edit thành công");
							}catch (Exception e) {
								t.rollback();
								model.addAttribute("message", "Edit thất bại!");
							}finally {
								session.close();
							}
								return "admin/edit";
							}
							else if(20<=tom.getMasanpham()&&tom.getMasanpham()<40)
							{
								Session session = factory.openSession();
								CuaGhe sp = (CuaGhe) session.get(CuaGhe.class,tom.getMasanpham());
								Transaction t = session.beginTransaction();
								try {
									String masanpham = request.getParameter("masanpham");
									int msp = Integer.parseInt( masanpham);
									String tensanpham = request.getParameter("tensanpham");
									String hinhanh = request.getParameter("hinhanh");
									String motangan = request.getParameter("motangan");
									String giagoc =request.getParameter("giagoc");
									float ggoc = Float.parseFloat(giagoc);								
									
									sp.setMasanpham(msp);
									sp.setTensanpham(tensanpham);
									sp.setHinhanh(hinhanh);
									sp.setMotangan(motangan);
									sp.setGiagoc(ggoc);
								
									
									session.update(sp);
									t.commit();
									model.addAttribute("message", "Edit thành công");
								}catch (Exception e) {
									t.rollback();
									model.addAttribute("message", "Edit thất bại!");
								}finally {
									session.close();
								}
									return "admin/edit";
							}
							else if(tom.getMasanpham()>=40)
							{
								Session session = factory.openSession();
								Ca sp = (Ca) session.get(Ca.class,tom.getMasanpham());
								Transaction t = session.beginTransaction();
								try {
									String masanpham = request.getParameter("masanpham");
									int msp = Integer.parseInt( masanpham);
									String tensanpham = request.getParameter("tensanpham");
									String hinhanh = request.getParameter("hinhanh");
									String motangan = request.getParameter("motangan");
									String giagoc =request.getParameter("giagoc");
									float ggoc = Float.parseFloat(giagoc);								
									
									sp.setMasanpham(msp);
									sp.setTensanpham(tensanpham);
									sp.setHinhanh(hinhanh);
									sp.setMotangan(motangan);
									sp.setGiagoc(ggoc);
								
									
									session.update(sp);
									t.commit();
									model.addAttribute("message", "Edit thành công");
								}catch (Exception e) {
									t.rollback();
									model.addAttribute("message", "Edit thất bại!");
								}finally {
									session.close();
								}
									return "admin/edit";
							}
				
			return "admin/qlsanpham";
		}
		
		
		@RequestMapping(value="loginadmin",method = RequestMethod.GET)
		public String login(ModelMap model) {
			model.addAttribute("user", admin);
			return"admin/login";
		}
		
		@RequestMapping(value="admininsert",method = RequestMethod.GET)
		public String insert() {
			return"admin/insert";
		}
		
		@RequestMapping("insert")
		public String upload(ModelMap model,
							@RequestParam("image")MultipartFile image,
							HttpServletRequest request) {
			if(image.isEmpty()) {
				model.addAttribute("message", "Vui lòng chọn lại!");
			}else {
				try {
					String loai = "";
					if(request.getParameter("tom")!=null)
					{
						loai = "Tom";
						String path ="C:\\Users\\ADMIN\\eclipse-workspace\\test4\\WebContent\\shop\\image\\"+loai;
						//String path = request.getServletContext().getRealPath("images");
						System.out.println(path);
						File fileDir = new File(path);
						image.transferTo(new File(fileDir+File.separator+image.getOriginalFilename()));
						
						String tensp = request.getParameter("tensp");
						String hinhanh = "shop/image/"+loai+"/"+image.getOriginalFilename();
						String mota = request.getParameter("mota");
						String giagoc = request.getParameter("giagoc");
						float gc = Float.parseFloat(giagoc) ;
						
						Tom sanpham = new Tom();
						sanpham.setTensanpham(tensp);
						sanpham.setHinhanh(hinhanh);
						sanpham.setMotangan(mota);
						sanpham.setGiagoc(gc);
						Session session = factory.openSession();
						Transaction t = session.beginTransaction();
						
						try {
							session.save(sanpham);
							t.commit();
							model.addAttribute("message", "Them moi thanh cong");
						}catch (Exception e) {
							t.rollback();
							model.addAttribute("message", "Them moi that bai!");
						}finally {
							session.close();
						}
						return "admin/insert";
					}
					else if(request.getParameter("cuaghe")!=null)
					{
						loai = "CuaGhe";
						String path ="C:\\Users\\ADMIN\\eclipse-workspace\\test4\\WebContent\\shop\\image\\"+loai;
						//String path = request.getServletContext().getRealPath("images");
						System.out.println(path);
						File fileDir = new File(path);
						image.transferTo(new File(fileDir+File.separator+image.getOriginalFilename()));
						
						String tensp = request.getParameter("tensp");
						String hinhanh = "shop/image/"+loai+"/"+image.getOriginalFilename();
						String mota = request.getParameter("mota");
						String giagoc = request.getParameter("giagoc");
						float gc = Float.parseFloat(giagoc) ;
						CuaGhe sanpham = new CuaGhe();
						sanpham.setTensanpham(tensp);
						sanpham.setHinhanh(hinhanh);
						sanpham.setMotangan(mota);
						sanpham.setGiagoc(gc);
						Session session = factory.openSession();
						Transaction t = session.beginTransaction();
						
						try {
							session.save(sanpham);
							t.commit();
							model.addAttribute("message", "Them moi thanh cong");
						}catch (Exception e) {
							t.rollback();
							model.addAttribute("message", "Them moi that bai!");
						}finally {
							session.close();
						}
						return "admin/insert";
					}
					else if(request.getParameter("ca")!=null)
					{
						loai = "Ca";
						String path ="C:\\Users\\ADMIN\\eclipse-workspace\\test4\\WebContent\\shop\\image\\"+loai;
						//String path = request.getServletContext().getRealPath("images");
						System.out.println(path);
						File fileDir = new File(path);
						image.transferTo(new File(fileDir+File.separator+image.getOriginalFilename()));
						
						String tensp = request.getParameter("tensp");
						String hinhanh = "shop/image/"+loai+"/"+image.getOriginalFilename();
						String mota = request.getParameter("mota");
						String giagoc = request.getParameter("giagoc");
						float gc = Float.parseFloat(giagoc) ;
						Ca sanpham = new Ca();
						sanpham.setTensanpham(tensp);
						sanpham.setHinhanh(hinhanh);
						sanpham.setMotangan(mota);
						sanpham.setGiagoc(gc);
						Session session = factory.openSession();
						Transaction t = session.beginTransaction();
						
						try {
							session.save(sanpham);
							t.commit();
							model.addAttribute("message", "Them moi thanh cong");
						}catch (Exception e) {
							t.rollback();
							model.addAttribute("message", "Them moi that bai!");
						}finally {
							session.close();
						}
						return "admin/insert";
					}
					
					//model.addAttribute("name", image.getOriginalFilename());
					//model.addAttribute("type", image.getContentType());
					//model.addAttribute("size", image.getSize());
					
				}catch(Exception e) {
					model.addAttribute("message", "Lỗi lưu file!");
				}
			}
			
			return "admin/insert";
		}
		
		@RequestMapping(value="changepass",method = RequestMethod.GET)
		public String change(ModelMap model) {
			return"admin/changepass";
		}
		
		@RequestMapping(value="change", method = RequestMethod.POST)
		public String change2(ModelMap model,
							HttpServletRequest request) {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
				try {
				String mkc = request.getParameter("mkc");
				String mkm = request.getParameter("mkm");
				if(mkc.equals(admin.getPassword()))
				{
					admin.setPassword(mkm);
					session.update(admin);
					t.commit();
					model.addAttribute("message", "Đổi mật khẩu thành công");
					return "admin/changepass";
				}
				else
				{
					model.addAttribute("message", "Mật khẩu cũ không đúng!");
					return "admin/changepass";
				}
				
			}catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Edit thất bại!");
			}finally {
				session.close();
			}
				return "admin/changepass";
		}
		
		
}
