package www.change.tm.changeshop.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import www.change.tm.changeshop.domain.Good;
import www.change.tm.changeshop.domain.GoodCustom;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.mapper.GoodMapper;
import www.change.tm.changeshop.service.GoodService;

@Service("goodService")
public class GoodServiceImpl implements GoodService {

	private GoodMapper goodMapper;

	@Resource
	public void setGoodMapper(GoodMapper goodMapper) {
		this.goodMapper = goodMapper;
	}

	@Override
	public int saveObject(Good entity) {
		// TODO Auto-generated method stub
		return goodMapper.saveObject(entity);
	}

	@Override
	public int updateObject(Good entity) {
		// TODO Auto-generated method stub
		return goodMapper.updateObject(entity);
	}

	@Override
	public int deleteObject(Good entity) {
		// TODO Auto-generated method stub
		return goodMapper.deleteObject(entity);
	}

	@Override
	public int deleteObjectById(Integer id) {
		// TODO Auto-generated method stub
		return goodMapper.deleteObjectById(id);
	}

	@Override
	public GoodCustom getObjectById(Integer id) {
		// TODO Auto-generated method stub
		return goodMapper.getObjectById(id);
	}

	@Override
	public List<GoodCustom> getObjects(QueryVo<GoodCustom> vo) {
		// TODO Auto-generated method stub
		return goodMapper.getObjects(vo);
	}

	@Override
	public Integer getObjectsSize(QueryVo<GoodCustom> vo) {
		// TODO Auto-generated method stub
		return goodMapper.getObjectsSize(vo);
	}

	@Override
	public List<Good> getObjectsByInterpor(Integer good_interpor) {
		// TODO Auto-generated method stub
		return goodMapper.getObjectsByInterpor(good_interpor);
	}

	
}
