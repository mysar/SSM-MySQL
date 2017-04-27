package www.change.tm.changeshop.domain;

import java.io.Serializable;

import java.util.Date;
import java.util.List;



public class Address implements Serializable {

	// 序列化接口标识
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected  Integer id;// 送货地址编号
	protected String address;// 送货地址
	protected Date createDate;// 创建时间
	protected String name;// 收货人姓名
	protected String phone;// 收货人电话
	protected Integer uid;// uid 此送货地址所属的用户
	protected Integer defaultadd;// 默认地址
	protected String spare;// 备用字段
	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Address(Integer id, String address, Date createDate, String name, String phone, Integer uid,
			Integer defaultadd, String spare) {
		super();
		this.id = id;
		this.address = address;
		this.createDate = createDate;
		this.name = name;
		this.phone = phone;
		this.uid = uid;
		this.defaultadd = defaultadd;
		this.spare = spare;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getDefaultadd() {
		return defaultadd;
	}
	public void setDefaultadd(Integer defaultadd) {
		this.defaultadd = defaultadd;
	}
	public String getSpare() {
		return spare;
	}
	public void setSpare(String spare) {
		this.spare = spare;
	}
	@Override
	public String toString() {
		return "Address [id=" + id + ", address=" + address + ", createDate=" + createDate + ", name=" + name
				+ ", phone=" + phone + ", uid=" + uid + ", defaultadd=" + defaultadd + ", spare=" + spare + "]";
	}
	

}