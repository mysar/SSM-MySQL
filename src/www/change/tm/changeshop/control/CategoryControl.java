package www.change.tm.changeshop.control;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.change.tm.changeshop.domain.Category;
import www.change.tm.changeshop.domain.CategoryCustom;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.service.CategoryService;
import www.change.tm.changeshop.util.Paging;

@Controller
@RequestMapping("/change")
public class CategoryControl {

	private CategoryService categoryService;

	@Resource
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	@RequestMapping("/goCategory.action")
	public String goCategory() {

		return "category/category_list";
	}

	@RequestMapping("/categorySelect.action")
	@ResponseBody
	public Paging<CategoryCustom> select(QueryVo<CategoryCustom> vo, Integer rows, Integer page ,HttpServletRequest request) {
 
		String name = request.getParameter("names");
		String pname = request.getParameter("pname");
		
		CategoryCustom category=new CategoryCustom();
		category.setName(name);
		category.setPname(pname);
		vo.setEntity(category);
		
		// 获取总记录数
		Integer total = categoryService.getObjectsSize(vo);
		// 创建分页对象
		Paging<CategoryCustom> paging = new Paging<CategoryCustom>(page, rows, total);

		// 设置开始记录
		vo.setStartSize(paging.getStartRecorder());
		vo.setPageSize(paging.getPageSize());

		// 查询当前数据
		List<CategoryCustom> users = categoryService.getObjects(vo);
		// 设置到分页对象中
		paging.setRows(users);
		// 返回paging对象
		return paging;

	}
	@RequestMapping("/categorySelectAll.action")
	@ResponseBody
	public List<CategoryCustom> select(QueryVo<CategoryCustom> vo,HttpServletRequest request) {
 
//		String name = request.getParameter("names");
//		String pname = request.getParameter("pname");
//
//		
//		CategoryCustom category=new CategoryCustom();
//		category.setName(name);
//		category.setPname(pname);
//
//		vo.setEntity(category);
		List<CategoryCustom> objects = categoryService.getObjects(vo);
		
		// 返回paging对象
		return objects;

	}
	// 添加
	@RequestMapping("/goAddCategory.action")
	public String goAddCategory() {
		
		return "category/category_add";
	}
	@ResponseBody
	@RequestMapping(value = {"/saveCategory.action"}, method = RequestMethod.POST)
	public int saveCategory(Category category) {
		
		int id = categoryService.saveObject(category);
		
		return id;
	}

    // 更新数据
	@RequestMapping("/go_update_category.action")
	public String goupdateCategory (Integer id,Model model) {
		Category  entity = categoryService.getObjectById(id);
		model.addAttribute("entity", entity);
		return "category/category_update";
		
	}
	@ResponseBody
	@RequestMapping("/updateCategory.action")
	public int update(Category category) {
		System.out.println(category+"--------------------------------------------------------------");
		int id = categoryService.updateObject(category);
		//return id;
		return id;
	}
	
	@ResponseBody
	@RequestMapping(value = {"/delete_category.action"}, method = RequestMethod.POST)
	public int delete(Integer id) {
		
		int id2 = categoryService.deleteObjectById(id);
		return id2;
	}

}
