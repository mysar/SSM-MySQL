package www.change.tm.changeshop.domain;

import java.io.Serializable;
import java.util.Date;

public class Activity implements Serializable {
	private Integer id;

	private Integer interpor;

	private Date addTime;

	private String href;

	private String img;

	private String name;

	private Date outTime;

	private String remark;

	private String spare;

	private static final long serialVersionUID = 1L;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getInterpor() {
		return interpor;
	}

	public void setInterpor(Integer interpor) {
		this.interpor = interpor;
	}

	

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public Date getOutTime() {
		return outTime;
	}

	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getSpare() {
		return spare;
	}

	public void setSpare(String spare) {
		this.spare = spare;
	}

	@Override
	public String toString() {
		return "Activity [id=" + id + ", interpor=" + interpor + ", addTime=" + addTime + ", href=" + href + ", img="
				+ img + ", name=" + name + ", outTime=" + outTime + ", remark=" + remark + ", spare=" + spare + "]";
	}
	
	
}