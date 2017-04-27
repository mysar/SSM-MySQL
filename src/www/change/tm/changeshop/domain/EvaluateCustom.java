package www.change.tm.changeshop.domain;


public class EvaluateCustom extends Evaluate {

	private String gname;//对应good的name
	private String uname;
	
	public EvaluateCustom() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	@Override
	public String toString() {
		return "EvaluateCustom [gname=" + gname + ", uname=" + uname + ", id=" + id + ", message=" + message
				+ ", comDate=" + comDate + ", spare=" + spare + ", uid=" + uid + ", gid=" + gid + "]";
	}

	
	

}
