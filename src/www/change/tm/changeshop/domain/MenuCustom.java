package www.change.tm.changeshop.domain;

public class MenuCustom extends Menu {
	// 父类型名称
	private String pname;

	public MenuCustom() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPname() {
		return pname;
	}

	@Override
	public String toString() {
		return "MenuCustom [pname=" + pname + ", id=" + id + ", icon=" + icon + ", name=" + name + ", url=" + url
				+ ", mid=" + mid + "]";
	}

	
	
}
