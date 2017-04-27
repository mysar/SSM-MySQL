package www.change.tm.changeshop.domain;

import java.io.Serializable;

public class CategoryCustom extends Category implements Serializable {

	private static final long serialVersionUID = 1L;

	String pname;

	public CategoryCustom() {
		super();
	}

	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPname() {
		return pname;
	}

	@Override
	public String toString() {
		return "CategoryCustom [pname=" + pname + ", id=" + id + ", name=" + name + ", number=" + number + ", remark="
				+ remark + ", spare=" + spare + ", cid=" + cid + ", enterimg=" + enterimg + ", outimg=" + outimg + "]";
	}

}