package www.change.tm.changeshop.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import www.change.tm.changeshop.domain.Category;
import www.change.tm.changeshop.domain.Good;
import www.change.tm.changeshop.domain.Imgs;
import www.change.tm.changeshop.service.CategoryService;
import www.change.tm.changeshop.service.GoodService;
import www.change.tm.changeshop.service.ImgsService;
@Controller
@RequestMapping("/change")
public class HomeControl {

	@Autowired
	private ImgsService imgsService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private GoodService goodService;

	@RequestMapping("index.action")
	public String initindex(HttpServletRequest request, HttpServletResponse response) {
	
		//List<Imgs> imgs = imgsService.getObjectsByInterpor(1);
		//List<Category> categories = categoryService.getObjectsByCid(null);

		// 获取今日推荐的商品
	//	List<Good> hote_goods = goodService.getObjectsByInterpor(3);
	//	request.setAttribute("hote_goods", hote_goods);
	//	request.setAttribute("categories", categories);
	//  request.setAttribute("imgs", imgs);
		return "one/home/home";
	}
	
}
