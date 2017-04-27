package www.change.tm.changeshop.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户实体Bean
 * @author change
 *
 */
public class Evaluate  implements Serializable{
	
	
	/**
	 * 
	 */
	protected static final long serialVersionUID = 1L;
	protected Integer id;
	protected String message;
	protected Date comDate;
	protected String spare;
	protected Integer uid;
	protected Integer gid;
	public Evaluate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Evaluate(Integer id, String message, Date comDate, String spare, Integer uid, Integer gid) {
		super();
		this.id = id;
		this.message = message;
		this.comDate = comDate;
		this.spare = spare;
		this.uid = uid;
		this.gid = gid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getComDate() {
		return comDate;
	}
	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}
	public String getSpare() {
		return spare;
	}
	public void setSpare(String spare) {
		this.spare = spare;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	@Override
	public String toString() {
		return "Evaluate [id=" + id + ", message=" + message + ", comDate=" + comDate + ", spare=" + spare + ", uid="
				+ uid + ", gid=" + gid + "]";
	}
	
	
	
	
}
