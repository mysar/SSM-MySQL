package www.change.tm.changeshop.domain;

import java.io.Serializable;
import java.util.Date;

public class Orders implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected Integer id;
	protected Date signTime;
	protected String number;
	protected Date orderTime;
	protected Integer orderType;
	protected Integer payType;
	protected String spare;
	protected double totalPrice;
	protected Integer aid;
	protected Integer uid;
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Orders(Integer id, Date signTime, String number, Date orderTime, Integer orderType, Integer payType,
			String spare, double totalPrice, Integer aid, Integer uid) {
		super();
		this.id = id;
		this.signTime = signTime;
		this.number = number;
		this.orderTime = orderTime;
		this.orderType = orderType;
		this.payType = payType;
		this.spare = spare;
		this.totalPrice = totalPrice;
		this.aid = aid;
		this.uid = uid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getSignTime() {
		return signTime;
	}
	public void setSignTime(Date signTime) {
		this.signTime = signTime;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public Integer getOrderType() {
		return orderType;
	}
	public void setOrderType(Integer orderType) {
		this.orderType = orderType;
	}
	public Integer getPayType() {
		return payType;
	}
	public void setPayType(Integer payType) {
		this.payType = payType;
	}
	public String getSpare() {
		return spare;
	}
	public void setSpare(String spare) {
		this.spare = spare;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	
}
