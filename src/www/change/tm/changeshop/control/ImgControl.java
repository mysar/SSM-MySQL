package www.change.tm.changeshop.control;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import www.change.tm.changeshop.domain.Img;
import www.change.tm.changeshop.domain.ImgCustom;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.service.ImgService;
import www.change.tm.changeshop.util.Paging;

@Controller
@RequestMapping("/change")
public class ImgControl {
	private ImgService imgService;
	
	
	@Resource
	public void setImgService(ImgService imgService) {
		this.imgService = imgService;
	}
	
	@RequestMapping("/goImg.action")
	public String goImg(){
		return "img/list";
	}
	

	@RequestMapping("/imgSelect.action")
	@ResponseBody
	public Paging<ImgCustom> select(QueryVo<ImgCustom> vo,Integer rows,Integer page,ImgCustom Img){
		vo.setEntity(Img);
		//获取总记录数
		Integer total = imgService.getObjectsSize(vo);
		//创建分页对象
		Paging<ImgCustom> paging = new Paging<ImgCustom>(page, rows, total);
		//设置开始记录
		vo.setStartSize(paging.getStartRecorder());
		vo.setPageSize(paging.getPageSize());
		//查询当前数据
		List<ImgCustom> img = imgService.getObjects(vo);
		
		//把它设置到分页对象中
		paging.setRows(img);
		//返回paging对象
		return paging;
	}
	@RequestMapping("/goAddImg.action")
	public String goAddImg(){
		return "img/add";
	}
	@RequestMapping("/addImg.action")
	@ResponseBody
	public Integer AddImg(Img img){
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+img);
		int i = imgService.saveObject(img);
		return i;
	}
	@RequestMapping("/goEditImg.action")
	public ModelAndView goEdit(Integer id ){
		Img objectById = imgService.getObjectById(id);
		ModelAndView modelAndView = new ModelAndView("img/update");
		modelAndView.addObject("entity", objectById);
		return modelAndView;
	}
	@RequestMapping("/updateImg.action")
	@ResponseBody
	public Integer updateUser(Img img){
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+img);
		int i = imgService.updateObject(img);
		return i;
	}
	@RequestMapping("/deleteImg.action")
	@ResponseBody
	public Boolean deleteUser(String ids){
		Boolean falg=false;
		String[] arr = ids.split(",");
		for (int i = 0; i < arr.length; i++) {

			int deleteObjectById = imgService.deleteObjectById(Integer.valueOf(arr[i]));
			falg=true;
		}
		return falg;
	}
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	@RequestMapping("/imgSelectAll.action")
	@ResponseBody
	public List<ImgCustom> selecta(QueryVo<ImgCustom> vo,ImgCustom img){
		vo.setEntity(img);
		List<ImgCustom> list = imgService.getObjects(vo);
		
		
		return list;
	}
}
