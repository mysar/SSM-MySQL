package www.change.tm.changeshop.domain;

import java.io.Serializable;

public class Category implements Serializable {
	
	private static final long serialVersionUID = 1L;
    
	protected Integer id;
	protected String name;
	protected String number;
	protected String remark;
	protected String spare;
	protected Integer cid;
	protected String enterimg;
	protected String outimg;
	
	public Category() {
		super();
	}
	public Category(Integer id, String name, String number, String remark, String spare, Integer cid, String enterimg,
			String outimg) {
		super();
		this.id = id;
		this.name = name;
		this.number = number;
		this.remark = remark;
		this.spare = spare;
		this.cid = cid;
		this.enterimg = enterimg;
		this.outimg = outimg;
	}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
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

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getEnterimg() {
        return enterimg;
    }

    public void setEnterimg(String enterimg) {
        this.enterimg = enterimg;
    }

    public String getOutimg() {
        return outimg;
    }

    public void setOutimg(String outimg) {
        this.outimg = outimg;
    }
}