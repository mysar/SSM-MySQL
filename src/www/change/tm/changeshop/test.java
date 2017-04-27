package www.change.tm.changeshop;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import www.change.tm.changeshop.domain.EvaluateCustom;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.domain.Users;
import www.change.tm.changeshop.mapper.EvaluateMapper;
import www.change.tm.changeshop.service.EvaluateService;
import www.change.tm.changeshop.service.UsersService;

public class test {
	private EvaluateMapper evaluateMapper;
	private EvaluateService evaluateService;
	private UsersService usersService;
	@Resource
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}
	
	@Resource
	public void setEvaluateService(EvaluateService evaluateService) {
		this.evaluateService = evaluateService;
	}


	@Test
	public void testsave(){
		Users users = new Users(null, null, null, null, "22222", null, null, null, null, null, null, null);
		int saveObject = usersService.saveObject(users);
		System.out.println(saveObject);
	}
	@Test
	public void testsaveww(){
		EvaluateCustom evaluate = new EvaluateCustom();
		QueryVo<EvaluateCustom> vo = new QueryVo<EvaluateCustom>();
		vo.setEntity(evaluate);
		List<EvaluateCustom> objects = evaluateMapper.getObjects(vo);
		for(EvaluateCustom o:objects){
			System.out.println(o);
		}
	}
}
