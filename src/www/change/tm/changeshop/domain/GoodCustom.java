package www.change.tm.changeshop.domain;

import java.io.Serializable;
public class GoodCustom extends Good implements Serializable {

	private static final long serialVersionUID = 1L;
	
	String aname;  // 关联activity 
	String cname;  // 关联category

	public GoodCustom() {
		super();
	}
	
	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}
	
	@Override
	public String toString() {
		return "GoodCustom [aname=" + aname + ", cname=" + cname + ", id=" + id + ", addtime=" + addtime + ", click="
				+ click + ", createdate=" + createdate + ", hote=" + hote + ", interpor=" + interpor + ", name=" + name
				+ ", num=" + num + ", number=" + number + ", outdate=" + outdate + ", price=" + price + ", quantity="
				+ quantity + ", remark=" + remark + ", spare=" + spare + ", acid=" + acid + ", cid=" + cid + "]";
	}

}
