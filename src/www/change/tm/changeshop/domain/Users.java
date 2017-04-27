package www.change.tm.changeshop.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户实体Bean
 * @author change
 *
 */
public class Users  implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//序号
	private Integer id;
	//管理员标识符 1 是管理员  0 会员
	private Integer admin;
	//用户邮箱
	private String email;
	//用户真实名称
	private String name;
	//用户密码
	private String password;
	//用户的电话
	private String phone;
	//用户的注册时间
	private Date registTime;
	//用户的性别
	private String sex;
	//扩展字段
	private String spare;
	//是否绑定手机登陆  1是绑定 0 未绑定 默认值是0 
	private Integer telbind;
	//登陆名称
	private String userName;
	//是否激活，1是激活，0是为激活，默认值是0 
	private Integer state;
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Users(Integer id, Integer admin, String email, String name, String password, String phone, Date registTime,
			String sex, String spare, Integer telbind, String userName, Integer state) {
		super();
		this.id = id;
		this.admin = admin;
		this.email = email;
		this.name = name;
		this.password = password;
		this.phone = phone;
		this.registTime = registTime;
		this.sex = sex;
		this.spare = spare;
		this.telbind = telbind;
		this.userName = userName;
		this.state = state;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAdmin() {
		return admin;
	}
	public void setAdmin(Integer admin) {
		this.admin = admin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getRegistTime() {
		return registTime;
	}
	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSpare() {
		return spare;
	}
	public void setSpare(String spare) {
		this.spare = spare;
	}
	public Integer getTelbind() {
		return telbind;
	}
	public void setTelbind(Integer telbind) {
		this.telbind = telbind;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", admin=" + admin + ", email=" + email + ", name=" + name + ", password=" + password
				+ ", phone=" + phone + ", registTime=" + registTime + ", sex=" + sex + ", spare=" + spare + ", telbind="
				+ telbind + ", userName=" + userName + ", state=" + state + "]";
	}
	
	
}
