package www.change.tm.changeshop.service;

import java.util.List;

import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.domain.Imgs;

public interface ImgsService {
	/**
	 * 保存实体对象
	 * 
	 * @param entity
	 * @return
	 */
	int saveObject(Imgs entity);

	/**
	 * 更新实体对象
	 * 
	 * @param entity
	 * @return
	 */
	int updateObject(Imgs entity);

	/**
	 * 删除实体对象
	 * @param entity
	 * @return
	 */
	int deleteObject(Imgs entity);

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
	Imgs getObjectById(Integer id);

	/**
	 * 条件查询0
	 * @param vo
	 * @return
	 */
	List<Imgs> getObjects(QueryVo<Imgs> vo);
	/**
	 * 获取总记录数
	 * @param vo
	 * @return
	 */
	Integer getObjectsSize(QueryVo<Imgs> vo);
	/**
	 * @param interpor
	 * @return
	 */
	List<Imgs> getObjectsByInterpor(Integer interpor);
	
}
