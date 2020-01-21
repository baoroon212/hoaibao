package poly.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="DonHang")
public class DonHang {
	@Id
	@Column(name="MaDonHang")
	private int madonhang;
	@Column(name="TenSanPham")
	private String tensanpham;
	@Column(name="MaSanPham")
	private int masanpham;
	@Column(name="NgayDatHang")
	private String ngaydathang;
	@Column(name="HoTen")
	private String hoten;
	@Column(name="DiaChi")
	private String diachi;
	@Column(name="SDT")
	private String sdt;
	@Column(name="Email")
	private String email;
	@Column(name="SoLuongSanPham")
	private int soluong;
	@Column(name="TongTien")
	private float tongtien;
	public int getMadonhang() {
		return madonhang;
	}
	public void setMadonhang(int madonhang) {
		this.madonhang = madonhang;
	}
	
	public String getTensanpham() {
		return tensanpham;
	}
	public void setTensanpham(String tiensanpham) {
		this.tensanpham = tiensanpham;
	}
	public int getMasanpham() {
		return masanpham;
	}
	public void setMasanpham(int masanpham) {
		this.masanpham = masanpham;
	}
	public String getNgaydathang() {
		return ngaydathang;
	}
	public void setNgaydathang(String ngaydathang) {
		this.ngaydathang = ngaydathang;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public float getTongtien() {
		return tongtien;
	}
	public void setTongtien(float tongtien) {
		this.tongtien = tongtien;
	}
	
	
}
