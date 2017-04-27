package www.change.tm.changeshop.mapper;

import java.util.List;

import www.change.tm.changeshop.domain.Evaluate;
import www.change.tm.changeshop.domain.EvaluateCustom;
import www.change.tm.changeshop.domain.QueryVo;

/**
 * mapper
 *
 */
public interface EvaluateMapper {

	/**
	 * 保存实体对象
	 * 
	 * @param entity
	 * @return
	 */
	int saveObject(Evaluate entity);

	/**
	 * 更新实体对象
	 * 
	 * @param entity
	 * @return
	 */
	int updateObject(Evaluate entity);

	/**
	 * 删除实体对象
	 * 
	 * @param entity
	 * @return
	 */
	int deleteObject(Evaluate entity);

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
	EvaluateCustom getObjectById(Integer id);

	/**
	 * 条件查询
	 * 
	 * @param vo
	 * @return
	 */
	List<EvaluateCustom> getObjects(QueryVo<EvaluateCustom> vo);

	/**
	 * 获取总记录数
	 * 
	 * @param vo
	 * @return
	 */
	Integer getObjectsSize(QueryVo<EvaluateCustom> vo);
	
	List<EvaluateCustom> getObjectsAll(QueryVo<EvaluateCustom> vo);
}
