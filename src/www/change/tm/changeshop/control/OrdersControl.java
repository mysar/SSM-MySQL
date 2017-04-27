package www.change.tm.changeshop.control;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.change.tm.changeshop.domain.Orders;
import www.change.tm.changeshop.domain.OrdersCustom;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.service.OrdersService;
import www.change.tm.changeshop.util.Paging;

@Controller
@RequestMapping("/change")
public class OrdersControl {
	
	private OrdersService ordersService;
	
	@Resource
	public void setOrdersService(OrdersService ordersService) {
		this.ordersService = ordersService;
	}

	
	@RequestMapping("/ordersSelect.action")
	@ResponseBody
	public Paging<OrdersCustom> select(QueryVo<OrdersCustom> vo,Integer rows,Integer page,HttpServletRequest request){
		String number = request.getParameter("number");
		OrdersCustom order = new OrdersCustom();
		order.setNumber(number);
		vo.setEntity(order);
		//获取总记录数
		Integer total = ordersService.getObjectsSize(vo);
		//创建分页对象
		Paging<OrdersCustom> paging = new Paging<OrdersCustom>(page, rows, total);
		//设置开始记录
		vo.setStartSize(paging.getStartRecorder());
		vo.setPageSize(paging.getPageSize());
		//查询当前数据
		List<OrdersCustom> orders = ordersService.getObjects(vo);
		//把它设置到分页对象中
		paging.setRows(orders);
		//返回paging对象
		return paging;
	}
	
	@RequestMapping("/ordersSelectAll.action")
	@ResponseBody
	public List<OrdersCustom> select(QueryVo<OrdersCustom> vo,HttpServletRequest request) {

		List<OrdersCustom> objects = ordersService.getObjects(vo);
		
		System.out.println(objects+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		return objects;  //返回json
		

	}
	
	@RequestMapping("/goOrder.action")
	public String goAdmin(){
		return "/orders/orders_list";
	}
	
	@RequestMapping("/goAdd.action")
	public String goAdd(){
		return "/orders/orders_add";
	}
	
	@ResponseBody
	@RequestMapping(value = { "/ordersAdd.action" }, method = RequestMethod.POST)
	public Integer add(Orders orders) {
		int saveObject = ordersService.saveObject(orders);
		return saveObject;
	}
	
	@RequestMapping("/goUpdateOrders.action")
	public String goupdate(Integer id, Model model) throws Exception {

		Orders orders = ordersService.getObjectById(id);
		System.out.println(orders);
		model.addAttribute("orders", orders);
		return "/orders/orders_edit";
	}
	
	@ResponseBody
	@RequestMapping(value = { "/ordersUpdate.action" }, method = RequestMethod.POST)
	public Integer update(@Param("orders") Orders orders) {
		System.out.println(orders);
		int id = ordersService.updateObject(orders);
		return id;
	}
	@ResponseBody
	@RequestMapping(value = { "/deleteOrders.action" })
	public boolean delete(String ids) {
		String[] arr = ids.split(",");
		boolean flag=false;
		System.out.println(ids+"@@@@@@@@@@@@@");
		
			for (int i = 0; i < arr.length; i++) {
				int id = ordersService.deleteObjectById(Integer.valueOf(arr[i]));
				flag=true;
			}
			return flag;
	}
	
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
}
