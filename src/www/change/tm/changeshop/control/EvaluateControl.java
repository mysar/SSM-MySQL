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

import www.change.tm.changeshop.domain.Evaluate;
import www.change.tm.changeshop.domain.EvaluateCustom;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.service.EvaluateService;
import www.change.tm.changeshop.util.Paging;

@Controller
@RequestMapping("/change")
public class EvaluateControl {
	private EvaluateService evaluateService;
	
	@Resource
	public void setEvaluateService(EvaluateService evaluateService) {
		this.evaluateService = evaluateService;
	}
	
	@RequestMapping("/goEvaluate.action")
	public String goEvaluate(){
		return "evaluate/list";
	}
	
	@RequestMapping("/evaluateSelect.action")
	@ResponseBody
	public Paging<EvaluateCustom> select(QueryVo<EvaluateCustom> vo,Integer rows,Integer page,EvaluateCustom evaluates){
		vo.setEntity(evaluates);
		//获取总记录数
		Integer total = evaluateService.getObjectsSize(vo);
		//创建分页对象
		Paging<EvaluateCustom> paging = new Paging<EvaluateCustom>(page, rows, total);
		//设置开始记录
		vo.setStartSize(paging.getStartRecorder());
		vo.setPageSize(paging.getPageSize());
		//查询当前数据
		List<EvaluateCustom> evaluate = evaluateService.getObjects(vo);
		
		//把它设置到分页对象中
		paging.setRows(evaluate);
		//返回paging对象
		return paging;
	}
	@RequestMapping("/goAddEvaluate.action")
	public String goAddEvaluate(){
		return "evaluate/add";
	}
	@RequestMapping("/addEvaluate.action")
	@ResponseBody
	public Integer AddUser(Evaluate evaluate){
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+evaluate);
		int i = evaluateService.saveObject(evaluate);
		return i;
	}
	@RequestMapping("/goEditEvaluate.action")
	public ModelAndView goEdit(Integer id ){int EvaluateCustom;
	
		EvaluateCustom objectById = evaluateService.getObjectById(id);
		ModelAndView modelAndView = new ModelAndView("evaluate/update");
		modelAndView.addObject("entity", objectById);
		return modelAndView;
	}
	@RequestMapping("/updateEvaluate.action")
	@ResponseBody
	public Integer updateUser(Evaluate evaluate){
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+evaluate);
		int i = evaluateService.updateObject(evaluate);
		return i;
	}
	@RequestMapping("/deleteEvaluate.action")
	@ResponseBody
	public Boolean deleteUser(String ids){
		Boolean falg=false;
		String[] arr = ids.split(",");
		for (int i = 0; i < arr.length; i++) {

			int deleteObjectById = evaluateService.deleteObjectById(Integer.valueOf(arr[i]));
			falg=true;
		}
		return falg;
	}
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	@RequestMapping("/evaluateSelectAll.action")
	@ResponseBody
	public List<EvaluateCustom> selecta(QueryVo<EvaluateCustom> vo,EvaluateCustom evaluates){
		vo.setEntity(evaluates);
		List<EvaluateCustom> list = evaluateService.getObjects(vo);
		
		
		return list;
	}
}
