package www.change.tm.changeshop.domain;

import java.io.Serializable;

/**
 * @author 
 */
public class Menu implements Serializable {
	protected Integer id;

	protected String icon;

	protected String name;

	protected String url;

    protected Integer mid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

	@Override
	public String toString() {
		return "Menu [id=" + id + ", icon=" + icon + ", name=" + name + ", url=" + url + ", mid=" + mid + "]";
	}
    
    
}