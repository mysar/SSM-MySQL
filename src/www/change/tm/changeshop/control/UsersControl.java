package www.change.tm.changeshop.control;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.domain.Users;
import www.change.tm.changeshop.service.UsersService;
import www.change.tm.changeshop.util.Paging;

@Controller
@RequestMapping("/change")
public class UsersControl {
	
	private UsersService usersService;
	
	@Resource
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}
	@RequestMapping("/goUser.action")
	public String goUser(){
		return "users/list";
	}
	@RequestMapping("/usersSelect.action")
	@ResponseBody
	public Paging<Users> select(QueryVo<Users> vo,Integer rows,Integer page,Users user){
		System.out.println("################################################"+vo.toString());
		vo.setEntity(user);
		//获取总记录数
		Integer total = usersService.getObjectsSize(vo);
		//创建分页对象
		Paging<Users> paging = new Paging<Users>(page, rows, total);
		//设置开始记录
		vo.setStartSize(paging.getStartRecorder());
		vo.setPageSize(paging.getPageSize());
		//查询当前数据
		List<Users> users = usersService.getObjects(vo);
		//把它设置到分页对象中
		paging.setRows(users);
		//返回paging对象
		return paging;
	}
	
	@RequestMapping("/usersSelectAll.action")
	@ResponseBody
	public List<Users> select(QueryVo<Users> vo,HttpServletRequest request){
		
		
		List<Users> objects = usersService.getObjects(vo);
		//把它设置到分页对象中
		return objects;
	}
	
	
	@RequestMapping("/goAddUser.action")
	public String goAddUser(){
		return "users/add";
	}
	@RequestMapping("/addUser.action")
	@ResponseBody
	public Integer AddUser(Users users){
		//users.setRegistTime(new Date());
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+users);
		int i = usersService.saveObject(users);
		return i;
	}
	@RequestMapping("/goEdit.action")
	public ModelAndView goEdit(Integer id ){
		Users objectById = usersService.getObjectById(id);
		ModelAndView modelAndView = new ModelAndView("users/update");
		modelAndView.addObject("entity", objectById);
		return modelAndView;
	}
	@RequestMapping("/updateUser.action")
	@ResponseBody
	public Integer updateUser(Users users){
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+users);
		int i = usersService.updateObject(users);
		return i;
	}
	@RequestMapping("/deleteUser.action")
	@ResponseBody
	public Boolean deleteUser(String ids){
		Boolean falg=false;
		String[] arr = ids.split(",");
		for (int i = 0; i < arr.length; i++) {

			int deleteObjectById = usersService.deleteObjectById(Integer.valueOf(arr[i]));
			falg=true;
		}
		return falg;
	}
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

}
