package www.change.tm.changeshop.domain;

public class OrdersCustom extends Orders{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String uname;
	
	private String pname;

	public OrdersCustom() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public String getUname() {
		return uname;
	}



	public void setUname(String uname) {
		this.uname = uname;
	}



	public String getpname() {
		return pname;
	}



	public void setpname(String pname) {
		this.pname = pname;
	}



	@Override
	public String toString() {
		return "OrdersCustom [uname=" + uname + ", pname=" + pname + ", id=" + id + ", signTime=" + signTime
				+ ", number=" + number + ", orderTime=" + orderTime + ", orderType=" + orderType + ", payType="
				+ payType + ", spare=" + spare + ", totalPrice=" + totalPrice + ", aid=" + aid + ", uid=" + uid + "]";
	}



	



	



	
	
	
	
	
	
}
