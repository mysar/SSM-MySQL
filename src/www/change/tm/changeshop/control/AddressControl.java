package www.change.tm.changeshop.control;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.change.tm.changeshop.domain.Address;
import www.change.tm.changeshop.domain.AddressCustom;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.domain.Users;
import www.change.tm.changeshop.service.AddressService;
import www.change.tm.changeshop.util.Paging;

@Controller
@RequestMapping("/change")
public class AddressControl {

	private AddressService addressService;
	@Resource
    public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}
	

	@RequestMapping("/addressSelect.action")
	@ResponseBody
	public Paging<AddressCustom> select(QueryVo<AddressCustom> vo, Integer rows, Integer page, AddressCustom addressCustom) {
		// 获取总记录数
		System.out.println(addressCustom);
		vo.setEntity(addressCustom);
		Integer total = addressService.getObjectsSize(vo);
		// 创建分页对象
		Paging<AddressCustom> paging = new Paging<AddressCustom>(page, rows, total);
		// 设置开始记录
		vo.setStartSize(paging.getStartRecorder());
		vo.setPageSize(paging.getPageSize());
		// 查询当前数据
		List<AddressCustom> addressCustoms =addressService.getObjects(vo);
		// 把它设置到分页对象中
		paging.setRows(addressCustoms);
		// 返回paging对象
		return paging;
	}
	
	@RequestMapping("/addressSelectAll.action")
	@ResponseBody
	public List<AddressCustom> select(QueryVo<AddressCustom> vo,HttpServletRequest request){
		
		
		List<AddressCustom> objects = addressService.getObjects(vo);
		//把它设置到分页对象中
		return objects;
	}

	@RequestMapping("/goAddress.action")
	public String goAdmin() {
		return "/address/address_list";
	}

	@RequestMapping("/goAddAddress.action")
	public String goAddAddAddress() {
		return "/address/address_add";
	}

	@ResponseBody
	@RequestMapping(value = { "/addressAdd.action" }, method = RequestMethod.POST)
	public Integer add(Address address) {
		System.out.println(address);
		int saveObject = addressService.saveObject(address);
		return saveObject;
	}

	@RequestMapping("/goUpdateAddress.action")
	public String goupdate(Integer id, Model model) throws Exception {

		Address address = addressService.getObjectById(id);
		model.addAttribute("address", address);
		return "/address/address_edit";
	}

	@ResponseBody
	@RequestMapping(value = { "/addressUpdate.action" }, method = RequestMethod.POST)
	public Integer update(@Param("address") Address address) {
		System.out.println(address);
		int object = addressService.updateObject(address);
		return object;
	}

	@ResponseBody
	@RequestMapping(value = { "/deleteAddress.action" })
	public boolean delete(String ids) {
		String[] arr = ids.split(",");
		boolean flag = false;
		System.out.println(ids + "@@@@@@@@@@@@@");

		for (int i = 0; i < arr.length; i++) {
			int id = addressService.deleteObjectById(Integer.valueOf(arr[i]));
			flag = true;
		}
		return flag;
	}
	
	@ResponseBody
	@RequestMapping(value = { "/selectAddressAll.action" })
	public List<AddressCustom> selecta(QueryVo<AddressCustom> vo,AddressCustom addressCustom){
		vo.setEntity(addressCustom);
		List<AddressCustom> objects = addressService.getObjects(vo);
		
		return objects;
		
	}
}
