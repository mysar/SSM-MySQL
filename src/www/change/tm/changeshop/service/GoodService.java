package www.change.tm.changeshop.service;

import java.util.List;

import www.change.tm.changeshop.domain.Good;
import www.change.tm.changeshop.domain.GoodCustom;
import www.change.tm.changeshop.domain.QueryVo;

public interface GoodService {
	/**
	 * 保存实体对象	
	 * @param entity
	 * @return
	 */
	int saveObject(Good entity);

	/**
	 * 更新实体对象
	 * @param entity
	 * @return
	 */
	int updateObject(Good entity);

	/**
	 * 删除实体对象
	 * 
	 * @param entity
	 * @return
	 */
	int deleteObject(Good entity);

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
	GoodCustom getObjectById(Integer id);

	/**
	 * 条件查询
	 * 
	 * @param vo
	 * @return
	 */
	List<GoodCustom> getObjects(QueryVo<GoodCustom> vo);

	/**
	 * 获取总记录数
	 * 
	 * @param vo
	 * @return
	 */
	Integer getObjectsSize(QueryVo<GoodCustom> vo);
	
	List<Good> getObjectsByInterpor(Integer good_interpor);
}
