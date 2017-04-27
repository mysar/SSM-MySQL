package www.change.tm.changeshop.domain;

import java.util.Date;

public class AddressCustom extends Address{

	private Integer pid;
	private String pname;
	public AddressCustom() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AddressCustom(Integer pid, String pname) {
		super();
		this.pid = pid;
		this.pname = pname;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	@Override
	public String toString() {
		return "AddressCustom [pid=" + pid + ", pname=" + pname + "]";
	}

	
	
}
