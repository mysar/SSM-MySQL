package www.change.tm.changeshop.domain;

import java.io.Serializable;




public class Imgs implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String img;
	private String remark;
	private Integer interpor;
	public Imgs() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Imgs(Integer id, String img, String remark, Integer interpor) {
		super();
		this.id = id;
		this.img = img;
		this.remark = remark;
		this.interpor = interpor;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getInterpor() {
		return interpor;
	}
	public void setInterpor(Integer interpor) {
		this.interpor = interpor;
	}
	@Override
	public String toString() {
		return "Imgs [id=" + id + ", img=" + img + ", remark=" + remark + ", interpor=" + interpor + "]";
	}


}
