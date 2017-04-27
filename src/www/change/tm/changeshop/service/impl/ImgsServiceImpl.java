package www.change.tm.changeshop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.change.tm.changeshop.domain.Imgs;
import www.change.tm.changeshop.mapper.ImgsMapper;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.service.ImgsService;

@Service("imgsService")
public class ImgsServiceImpl implements ImgsService {
	@Autowired
	private ImgsMapper imgsMapper;

	@Resource
	public void setImgsMapper(ImgsMapper imgsMapper) {
		this.imgsMapper = imgsMapper;
	}

	@Override
	public int saveObject(Imgs entity) {
		// TODO Auto-generated method stub
		return imgsMapper.saveObject(entity);
	}

	@Override
	public int updateObject(Imgs entity) {
		// TODO Auto-generated method stub
		return imgsMapper.updateObject(entity);
	}

	@Override
	public int deleteObject(Imgs entity) {
		// TODO Auto-generated method stub
		return imgsMapper.deleteObject(entity);
	}

	@Override
	public int deleteObjectById(Integer id) {
		// TODO Auto-generated method stub
		return imgsMapper.deleteObjectById(id);
	}

	@Override
	public Imgs getObjectById(Integer id) {
		// TODO Auto-generated method stub
		return imgsMapper.getObjectById(id);
	}

	@Override
	public List<Imgs> getObjects(QueryVo<Imgs> vo) {
		// TODO Auto-generated method stub
		return imgsMapper.getObjects(vo);
	}

	@Override
	public Integer getObjectsSize(QueryVo<Imgs> vo) {
		// TODO Auto-generated method stub
		return imgsMapper.getObjectsSize(vo);
	}

	@Override
	public List<Imgs> getObjectsByInterpor(Integer interpor) {
		// TODO Auto-generated method stub
		return imgsMapper.getObjectsByInterpor(interpor);
	}

}
