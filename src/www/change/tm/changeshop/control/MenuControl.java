package www.change.tm.changeshop.control;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.change.tm.changeshop.domain.Menu;
import www.change.tm.changeshop.domain.MenuCustom;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.service.MenuService;
import www.change.tm.changeshop.util.Paging;

@Controller
@RequestMapping("/change")
public class MenuControl {
	
	private MenuService menuService;
	
	
	@Resource
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	@RequestMapping("/menuSelect.action")
	@ResponseBody
	public Paging<MenuCustom> select(QueryVo<MenuCustom> vo,Integer rows,Integer page,MenuCustom menuCustom){
		
	
		vo.setEntity(menuCustom);
		
		//获取总记录数
		Integer total = menuService.getObjectsSize(vo);
		//创建分页对象
		Paging<MenuCustom> paging = new Paging<MenuCustom>(page, rows, total);
		//设置开始记录
		vo.setStartSize(paging.getStartRecorder());
		vo.setPageSize(paging.getPageSize());
		//查询当前数据
		List<MenuCustom> menus = menuService.getObjects(vo);
		//把它设置到分页对象中
		paging.setRows(menus);
		//返回paging对象
		return paging;
	}
	@RequestMapping("/goMenu.action")
	public String goMenu(){
		return "/menu/list";
	} 
	@RequestMapping("/goAddMenu.action")
	public String goAddMenu(){
		return "menu/menu_add";
		
	}
	@RequestMapping(value={"/addMenu.action"},method=RequestMethod.POST)
	@ResponseBody
	public Integer add(Menu menu){
		System.out.println(menu);
		int i=menuService.saveObject(menu);
		return i;
		
	}
	@RequestMapping("/goUpdateMenu.action")
	public String goupdateMenu(Integer id,Model model){
		 MenuCustom entity = menuService.getObjectById(id);
		model.addAttribute("entity", entity);
		return "menu/menu_update";
	}
	
	@RequestMapping(value ={"/updateMenu.action"},method=RequestMethod.POST)
	@ResponseBody
	public Integer update(Menu menu){
		System.out.println(menu);
		int i=menuService.updateObject(menu);
		return i;
	}
	@RequestMapping(value ={"/deleteMenu.action"})
	@ResponseBody
	public Boolean delete(String ids){
		Boolean falg=false;
		String[] arr = ids.split(",");
		for (int i = 0; i < arr.length; i++) {

			int deleteObjectById = menuService.deleteObjectById(Integer.valueOf(arr[i]));
			falg=true;
		}
		return falg;

	}
	@RequestMapping(value ={"/selectMenuAll.action"})
	@ResponseBody
	public List<MenuCustom> selectmenuall(QueryVo<MenuCustom> vo,MenuCustom menuCustom){
		System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
		vo.setEntity(menuCustom);
		List<MenuCustom> objects = menuService.getObjects(vo);
		
		
		return objects;
				
	}
	
}
