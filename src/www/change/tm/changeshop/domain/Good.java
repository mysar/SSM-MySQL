package www.change.tm.changeshop.domain;

import java.io.Serializable;
import java.util.Date;

public class Good implements Serializable {

	
	private static final long serialVersionUID = 1L;
		 Integer id;
		 Date addtime;
		 Integer click;
		 Date createdate;
		 Integer hote;
		 Integer interpor;
		 String name;
		 Integer num;
		 String number;
		 Date outdate;
		 Double price;
		 Integer quantity;
		 String remark;
		 String spare;
		 Integer acid;
		 Integer cid;
		public Good() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Good(Integer id, Date addtime, Integer click, Date createdate, Integer hote, Integer interpor,
				String name, Integer num, String number, Date outdate, Double price, Integer quantity, String remark,
				String spare, Integer acid, Integer cid) {
			super();
			this.id = id;
			this.addtime = addtime;
			this.click = click;
			this.createdate = createdate;
			this.hote = hote;
			this.interpor = interpor;
			this.name = name;
			this.num = num;
			this.number = number;
			this.outdate = outdate;
			this.price = price;
			this.quantity = quantity;
			this.remark = remark;
			this.spare = spare;
			this.acid = acid;
			this.cid = cid;
		}
		
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public Date getAddtime() {
			return addtime;
		}
		public void setAddtime(Date addtime) {
			this.addtime = addtime;
		}
		public Integer getClick() {
			return click;
		}
		public void setClick(Integer click) {
			this.click = click;
		}
		public Date getCreatedate() {
			return createdate;
		}
		public void setCreatedate(Date createdate) {
			this.createdate = createdate;
		}
		public Integer getHote() {
			return hote;
		}
		public void setHote(Integer hote) {
			this.hote = hote;
		}
		public Integer getInterpor() {
			return interpor;
		}
		public void setInterpor(Integer interpor) {
			this.interpor = interpor;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public Integer getNum() {
			return num;
		}
		public void setNum(Integer num) {
			this.num = num;
		}
		public String getNumber() {
			return number;
		}
		public void setNumber(String number) {
			this.number = number;
		}
		public Date getOutdate() {
			return outdate;
		}
		public void setOutdate(Date outdate) {
			this.outdate = outdate;
		}
		public Double getPrice() {
			return price;
		}
		public void setPrice(Double price) {
			this.price = price;
		}
		public Integer getQuantity() {
			return quantity;
		}
		public void setQuantity(Integer quantity) {
			this.quantity = quantity;
		}
		public String getRemark() {
			return remark;
		}
		public void setRemark(String remark) {
			this.remark = remark;
		}
		public String getSpare() {
			return spare;
		}
		public void setSpare(String spare) {
			this.spare = spare;
		}
		public Integer getAcid() {
			return acid;
		}
		public void setAcid(Integer acid) {
			this.acid = acid;
		}
		public Integer getCid() {
			return cid;
		}
		public void setCid(Integer cid) {
			this.cid = cid;
		}
   
    
}

