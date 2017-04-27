package www.change.tm.changeshop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import www.change.tm.changeshop.domain.Category;
import www.change.tm.changeshop.domain.CategoryCustom;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.mapper.CategoryMapper;
import www.change.tm.changeshop.service.CategoryService;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

	private CategoryMapper categoryMapper;
	
	@Resource
	public void setCategoryMapper(CategoryMapper categoryMapper) {
		this.categoryMapper = categoryMapper;
	}
	@Override
	public int saveObject(Category entity) {
		// TODO Auto-generated method stub
		return categoryMapper.saveObject(entity);
	}

	@Override
	public int updateObject(Category entity) {
		// TODO Auto-generated method stub
		return categoryMapper.updateObject(entity);
	}

	@Override
	public int deleteObject(Category entity) {
		// TODO Auto-generated method stub
		return categoryMapper.deleteObject(entity);
	}

	@Override
	public int deleteObjectById(Integer id) {
		// TODO Auto-generated method stub
		return categoryMapper.deleteObjectById(id);
	}
	@Override
	public CategoryCustom getObjectById(Integer id) {
		// TODO Auto-generated method stub
		return categoryMapper.getObjectById(id);
	}
	@Override
	public List<CategoryCustom> getObjects(QueryVo<CategoryCustom> vo) {
		// TODO Auto-generated method stub
		return categoryMapper.getObjects(vo);
	}
	@Override
	public Integer getObjectsSize(QueryVo<CategoryCustom> vo) {
		// TODO Auto-generated method stub
		return categoryMapper.getObjectsSize(vo);
	}
	@Override
	public List<Category> getObjectsByCid(Integer cid) {
		// TODO Auto-generated method stub
		return categoryMapper.getObjectsByCid(cid);
	}
	

	
}
