package www.change.tm.changeshop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import www.change.tm.changeshop.domain.Activity;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.mapper.ActivityMapper;
import www.change.tm.changeshop.service.ActivityService;
@Service("activityService")
public class ActivityServiceImpl implements ActivityService{

	private ActivityMapper activityMapper;
	@Resource
	public void setActivityMapper(ActivityMapper activityMapper) {
		this.activityMapper = activityMapper;
	}
	@Override
	public int saveObject(Activity entity) {
		return activityMapper.saveObject(entity);
	}

	@Override
	public int updateObject(Activity entity) {
		return activityMapper.updateObject(entity);
	}

	@Override
	public int deleteObject(Activity entity) {
		return activityMapper.deleteObject(entity);
	}

	@Override
	public int deleteObjectById(Integer id) {
	return activityMapper.deleteObjectById(id);
	}

	@Override
	public Activity getObjectById(Integer id) {
		return activityMapper.getObjectById(id);
	}

	@Override
	public List<Activity> getObjects(QueryVo<Activity> vo) {
		return activityMapper.getObjects(vo);
	}

	@Override
	public Integer getObjectsSize(QueryVo<Activity> vo) {
		return activityMapper.getObjectsSize(vo);
	}

}
