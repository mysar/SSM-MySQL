package www.change.tm.changeshop.mapper;

import java.util.List;

import www.change.tm.changeshop.domain.Menu;
import www.change.tm.changeshop.domain.MenuCustom;
import www.change.tm.changeshop.domain.QueryVo;


/**
 * mapper
 *
 */
public interface MenuMapper {

	/**
	 * 保存实体对象
	 * 
	 * @param entity
	 * @return
	 */
	int saveObject(Menu entity);

	/**
	 * 更新实体对象
	 * 
	 * @param entity
	 * @return
	 */
	int updateObject(Menu entity);

	/**
	 * 删除实体对象
	 * 
	 * @param entity
	 * @return
	 */
	int deleteObject(Menu entity);

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
	MenuCustom getObjectById(Integer id);

	/**
	 * 条件查询
	 * 
	 * @param vo
	 * @return
	 */
	List<MenuCustom> getObjects(QueryVo<MenuCustom> vo);

	/**
	 * 获取总记录数
	 * 
	 * @param vo
	 * @return
	 */
	Integer getObjectsSize(QueryVo<MenuCustom> vo);
}
