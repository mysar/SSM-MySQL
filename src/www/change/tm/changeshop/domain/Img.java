package www.change.tm.changeshop.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户实体Bean
 * @author change
 *
 */
public class Img  implements Serializable{
	
	
	/**
	 * 
	 */
	protected static final long serialVersionUID = 1L;
	protected Integer id;
	protected String smallImg;
	protected String midImg;
	protected String bigImg;
	protected Integer interpor;
	protected String spare;
	protected Integer gid;
	public Img() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Img(Integer id, String smallImg, String midImg, String bigImg, Integer interpor, String spare, Integer gid) {
		super();
		this.id = id;
		this.smallImg = smallImg;
		this.midImg = midImg;
		this.bigImg = bigImg;
		this.interpor = interpor;
		this.spare = spare;
		this.gid = gid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSmallImg() {
		return smallImg;
	}
	public void setSmallImg(String smallImg) {
		this.smallImg = smallImg;
	}
	public String getMidImg() {
		return midImg;
	}
	public void setMidImg(String midImg) {
		this.midImg = midImg;
	}
	public String getBigImg() {
		return bigImg;
	}
	public void setBigImg(String bigImg) {
		this.bigImg = bigImg;
	}
	public Integer getInterpor() {
		return interpor;
	}
	public void setInterpor(Integer interpor) {
		this.interpor = interpor;
	}
	public String getSpare() {
		return spare;
	}
	public void setSpare(String spare) {
		this.spare = spare;
	}
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	@Override
	public String toString() {
		return "Img [id=" + id + ", smallImg=" + smallImg + ", midImg=" + midImg + ", bigImg=" + bigImg + ", interpor="
				+ interpor + ", spare=" + spare + ", gid=" + gid + "]";
	}
	
}
