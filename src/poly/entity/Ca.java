package poly.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="BangCa")
public class Ca {
	@Id
	@GeneratedValue
	@Column(name="MaSanPham")
	private int masanpham;
	@Column(name="TenSanPham")
	private String tensanpham;
	@Column(name="HinhAnh")
	private String hinhanh;
	@Column(name="MoTaNgan")
	private String motangan;
	@Column(name="GiaGoc")
	private float giagoc;
	
	public int getMasanpham() {
		return masanpham;
	}
	public void setMasanpham(int masanpham) {
		this.masanpham = masanpham;
	}
	
	public String getTensanpham() {
		return tensanpham;
	}
	public void setTensanpham(String tensanpham) {
		this.tensanpham = tensanpham;
	}
	public String getHinhanh() {
		return hinhanh;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	public String getMotangan() {
		return motangan;
	}
	public void setMotangan(String motangan) {
		this.motangan = motangan;
	}
	public float getGiagoc() {
		return giagoc;
	}
	public void setGiagoc(float giagoc) {
		this.giagoc = giagoc;
	}
	
	
}