package www.change.tm.changeshop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.change.tm.changeshop.domain.Menu;
import www.change.tm.changeshop.domain.MenuCustom;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.mapper.MenuMapper;
import www.change.tm.changeshop.service.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService{

	@Autowired
	private MenuMapper menuMapper;
	@Resource
	public void setMenuMapper(MenuMapper menuMapper) {
		this.menuMapper = menuMapper;
	}
	
	
	@Override
	public int saveObject(Menu entity) {
		return menuMapper.saveObject(entity);
	}

	@Override
	public int updateObject(Menu entity) {
		return menuMapper.updateObject(entity);
	}

	@Override
	public int deleteObject(Menu entity) {
		return menuMapper.deleteObject(entity);
	}

	@Override
	public int deleteObjectById(Integer id) {
		return menuMapper.deleteObjectById(id);
	}

	@Override
	public MenuCustom getObjectById(Integer id) {
		return menuMapper.getObjectById(id);
	}

	@Override
	public List<MenuCustom> getObjects(QueryVo<MenuCustom> vo) {
	
		return menuMapper.getObjects(vo);
	}

	@Override
	public Integer getObjectsSize(QueryVo<MenuCustom> vo) {
		return menuMapper.getObjectsSize(vo);
	}

}
