package www.change.tm.changeshop.control;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import www.change.tm.changeshop.domain.Activity;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.service.ActivityService;
import www.change.tm.changeshop.util.Paging;

@Controller
@RequestMapping("/change")
public class ActivityControl {
	
	private ActivityService activityService;
	
	
	@Resource
	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}
	
	@RequestMapping("/activitySelect.action")
	@ResponseBody
	public Paging<Activity> select(QueryVo<Activity> vo,Integer rows,Integer page,Activity activity){
		
	
		vo.setEntity(activity);
		
		//获取总记录数
		Integer total = activityService.getObjectsSize(vo);
		//创建分页对象
		Paging<Activity> paging = new Paging<Activity>(page, rows, total);
		//设置开始记录
		vo.setStartSize(paging.getStartRecorder());
		vo.setPageSize(paging.getPageSize());
		//查询当前数据
		List<Activity> activitys = activityService.getObjects(vo);
		//把它设置到分页对象中
		paging.setRows(activitys);
		//返回paging对象
		return paging;
	}
	@RequestMapping("/goActivity.action")
	public String goActivity(){
		return "/activity/list";
	} 
	@RequestMapping("/goAddActivity.action")
	public String goAddActivity(){
		return "activity/activity_add";
		
	}
	@RequestMapping(value={"/addActivity.action"},method=RequestMethod.POST)
	@ResponseBody
	public Integer add(Activity activity){
		System.out.println(activity);
		int i=activityService.saveObject(activity);
		return i;
		
	}
	@RequestMapping("/goUpdateActivity.action")
	public String goupdateActivity(Integer id,Model model){
		Activity entity = activityService.getObjectById(id);
		model.addAttribute("entity", entity);
		return "activity/activity_update";
	}
	
	@RequestMapping(value ={"/updateActivity.action"},method=RequestMethod.POST)
	@ResponseBody
	public Integer update(Activity activity){
		System.out.println(activity);
		int i=activityService.updateObject(activity);;
		return i;
	}
	@RequestMapping(value ={"/deleteActivity.action"},method=RequestMethod.POST)
	@ResponseBody
	public Boolean delete(String id){
		Boolean falg=false;
		String[] arr = id.split(",");
		for (int i = 0; i < arr.length; i++) {

			int deleteObjectById = activityService.deleteObjectById(Integer.valueOf(arr[i]));
			falg=true;
		}
		return falg;

	}
	
}
