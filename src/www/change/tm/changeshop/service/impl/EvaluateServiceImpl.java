package www.change.tm.changeshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.change.tm.changeshop.domain.Evaluate;
import www.change.tm.changeshop.domain.EvaluateCustom;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.mapper.EvaluateMapper;
import www.change.tm.changeshop.service.EvaluateService;

@Service("evaluateService")
public class EvaluateServiceImpl implements EvaluateService {
	@Autowired
	private EvaluateMapper evaluateMapper;

	@Override
	public int saveObject(Evaluate entity) {
		// TODO Auto-generated method stub
		return evaluateMapper.saveObject(entity)
				;
	}

	@Override
	public int updateObject(Evaluate entity) {
		// TODO Auto-generated method stub
		return evaluateMapper.updateObject(entity);
	}

	@Override
	public int deleteObject(Evaluate entity) {
		// TODO Auto-generated method stub
		return evaluateMapper.deleteObject(entity);
	}

	@Override
	public int deleteObjectById(Integer id) {
		// TODO Auto-generated method stub
		return evaluateMapper.deleteObjectById(id);
	}

	@Override
	public EvaluateCustom getObjectById(Integer id) {
		// TODO Auto-generated method stub
		return evaluateMapper.getObjectById(id);
	}

	@Override
	public List<EvaluateCustom> getObjects(QueryVo<EvaluateCustom> vo) {
		// TODO Auto-generated method stub
		return evaluateMapper.getObjects(vo);
	}

	@Override
	public Integer getObjectsSize(QueryVo<EvaluateCustom> vo) {
		return evaluateMapper.getObjectsSize(vo);
	}

	@Override
	public List<EvaluateCustom> getObjectsAll(QueryVo<EvaluateCustom> vo) {
		// TODO Auto-generated method stub
		return evaluateMapper.getObjectsAll(vo);
	}

	
}
