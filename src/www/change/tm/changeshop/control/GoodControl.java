package www.change.tm.changeshop.control;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.change.tm.changeshop.domain.Good;
import www.change.tm.changeshop.domain.GoodCustom;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.service.GoodService;
import www.change.tm.changeshop.util.Paging;

@Controller
@RequestMapping("/change")
public class GoodControl {

	private GoodService goodService;

	@Resource
	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}
	
	@RequestMapping("/goGood.action")
	public String goGood() {

		return "good/good_list";
	}

	@RequestMapping("/goodlist.action")
	@ResponseBody
	public Paging<GoodCustom> select(QueryVo<GoodCustom> vo, Integer rows, Integer page ,HttpServletRequest request) {
 
		String name = request.getParameter("names");
		String number = request.getParameter("numbers");

		GoodCustom good=new GoodCustom();
		good.setName(name);
		good.setNumber(number);
		vo.setEntity(good);

		// 获取总记录数
		Integer total = goodService.getObjectsSize(vo);
		// 创建分页对象
		Paging<GoodCustom> paging = new Paging<GoodCustom>(page, rows, total);

		// 设置开始记录
		vo.setStartSize(paging.getStartRecorder());
		vo.setPageSize(paging.getPageSize());

		// 查询当前数据
		List<GoodCustom> good1 = goodService.getObjects(vo);
		// 设置到分页对象中
		paging.setRows(good1);
		// 返回paging对象
		return paging;

	}
	
	@RequestMapping("/goodSelectAll.action")
	@ResponseBody
	public List<GoodCustom> select(QueryVo<GoodCustom> vo,HttpServletRequest request) {

		List<GoodCustom> objects = goodService.getObjects(vo);

		return objects;  //返回json

	}
	
	// 添加
	@RequestMapping("/go_add_good.action")
	public String goAddGood() {
		
		return "good/good_add";
	}
	@ResponseBody
	@RequestMapping(value = {"/saveGood.action"}, method = RequestMethod.POST)
	public int saveGood(Good good) {
		UUID uuid = UUID.randomUUID();
		good.setAddtime(new Date());
		good.setCreatedate(new Date());
		good.setNumber(uuid.toString());
		
		int id = goodService.saveObject(good);
		
		return id;
	}

    // 更新数据
	@RequestMapping("/go_update_good.action")
	public String goupdateGood (Integer id,Model model) {
		Good  entity = goodService.getObjectById(id);
		model.addAttribute("entity", entity);
		return "good/good_update";
		
	}
	@ResponseBody
	@RequestMapping("/update_good.action")
	public int updateGood(Good good) {
		System.out.println(good+"--------------------------------------------------------------");
		int id = goodService.updateObject(good);
		//return id;
		return id;
	}
	
	@ResponseBody
	@RequestMapping(value = {"/delete_good.action"}, method = RequestMethod.POST)
	public int delete(Integer id) {
		
		int id2 = goodService.deleteObjectById(id);
		return id2;
	}	
}

