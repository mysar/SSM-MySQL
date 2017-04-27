package www.change.tm.changeshop.service;

import java.util.List;

import www.change.tm.changeshop.domain.Category;
import www.change.tm.changeshop.domain.CategoryCustom;
import www.change.tm.changeshop.domain.QueryVo;

public interface CategoryService {
	/**
	 * 保存实体对象
	 * @param entity
	 * @return
	 */
	int saveObject(Category entity);

	/**
	 * 更新实体对象
	 * @param entity
	 * @return
	 */
	int updateObject(Category entity);

	/**
	 * 删除实体对象
	 * 
	 * @param entity
	 * @return
	 */
	int deleteObject(Category entity);

	/**
	 * 根据主键id删除实体对象
	 * 
	 * @param entity
	 * @return
	 */
	int deleteObjectById(Integer id);

	/**
	 * 根据id查询实体对象
	 * 
	 * @param id
	 * @return
	 */
	CategoryCustom getObjectById(Integer id);

	/**
	 * 条件查询
	 * 
	 * @param vo
	 * @return
	 */
	List<CategoryCustom> getObjects(QueryVo<CategoryCustom> vo);

	/**
	 * 获取总记录数
	 * 
	 * @param vo
	 * @return
	 */
	Integer getObjectsSize(QueryVo<CategoryCustom> vo);

	
	List<Category> getObjectsByCid(Integer cid);
}
