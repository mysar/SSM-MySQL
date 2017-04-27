package www.change.tm.changeshop.domain;


public class ImgCustom extends Img {

	private String gname;//对应good的name
	
	
	public ImgCustom() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	@Override
	public String toString() {
		return "ImgCustom [gname=" + gname + ", id=" + id + ", smallImg=" + smallImg + ", midImg=" + midImg
				+ ", bigImg=" + bigImg + ", interpor=" + interpor + ", spare=" + spare + ", gid=" + gid + "]";
	}

	

}
