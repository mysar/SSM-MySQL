package www.change.tm.changeshop.control;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.change.tm.changeshop.domain.Imgs;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.domain.Users;
import www.change.tm.changeshop.service.ImgsService;
import www.change.tm.changeshop.service.UsersService;
import www.change.tm.changeshop.util.Paging;

@Controller
@RequestMapping("/change")
public class ImgsControl {

	private ImgsService imgsService;
	@Resource
	public void setImgsService(ImgsService imgsService) {
		this.imgsService = imgsService;
	}

	@RequestMapping("/imgsSelect.action")
	@ResponseBody
	public Paging<Imgs> select(QueryVo<Imgs> vo, Integer rows, Integer page,Imgs imgs) {
		// 获取总记录数
		vo.setEntity(imgs);
		Integer total = imgsService.getObjectsSize(vo);
		// 创建分页对象
		Paging<Imgs> paging = new Paging<Imgs>(page, rows, total);
		// 设置开始记录
		vo.setStartSize(paging.getStartRecorder());
		vo.setPageSize(paging.getPageSize());
		// 查询当前数据
		List<Imgs> imgss = imgsService.getObjects(vo);
		// 把它设置到分页对象中
		paging.setRows(imgss);
		// 返回paging对象
		return paging;
	}

	@RequestMapping("/goImgs.action")
	public String goAdmin() {
		return "/imgs/imgs_list";
	}

	@RequestMapping("/goAddImgs.action")
	public String goAddUser() {
		return "/imgs/imgs_add";
	}
	@ResponseBody
	@RequestMapping(value = { "/imgsAdd.action" }, method = RequestMethod.POST)
	public Integer add(Imgs imgs) {
		int saveObject = imgsService.saveObject(imgs);
		return saveObject;
	}
	
	@RequestMapping("/goUpdateImgs.action")
	public String goupdate(Integer id, Model model) throws Exception {

		Imgs imgs = imgsService.getObjectById(id);
		model.addAttribute("imgs", imgs);
		return "/imgs/imgs_edit";
	}
	@ResponseBody
	@RequestMapping(value = { "/imgsUpdate.action" }, method = RequestMethod.POST)
	public Integer update(@Param("imgs") Imgs imgs) {
		System.out.println(imgs);
		int object = imgsService.updateObject(imgs);
		return object;
	}
	@ResponseBody
	@RequestMapping(value = { "/deleteImgs.action" })
	public boolean delete(String ids) {
		String[] arr = ids.split(",");
		boolean flag=false;
		System.out.println(ids+"@@@@@@@@@@@@@");
		
			for (int i = 0; i < arr.length; i++) {
				int id = imgsService.deleteObjectById(Integer.valueOf(arr[i]));
				flag=true;
			}
			return flag;
	}
}
