package www.change.tm.changeshop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.domain.Users;
import www.change.tm.changeshop.mapper.UsersMapper;
import www.change.tm.changeshop.service.UsersService;

@Service("usersService")
public class UsersServiceImpl implements UsersService {

	private UsersMapper usersMapper;

	@Resource
	public void setUsersMapper(UsersMapper usersMapper) {
		this.usersMapper = usersMapper;
	}

	@Override
	public int saveObject(Users entity) {
		return usersMapper.saveObject(entity);
	}

	@Override
	public int updateObject(Users entity) {
		return usersMapper.updateObject(entity);
	}

	@Override
	public int deleteObject(Users entity) {
		//return usersMapper.deleteObject(entity);
		return 0;
	}

	@Override
	public int deleteObjectById(Integer id) {
		return usersMapper.deleteObjectById(id);
	}

	@Override
	public Users getObjectById(Integer id) {
		return usersMapper.getObjectById(id);
	}

	@Override
	public List<Users> getObjects(QueryVo<Users> vo) {
		return usersMapper.getObjects(vo);
	}

	@Override
	public Integer getObjectsSize(QueryVo<Users> vo) {
		return usersMapper.getObjectsSize(vo);
	}

}
