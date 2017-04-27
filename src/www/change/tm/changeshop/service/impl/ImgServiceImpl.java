package www.change.tm.changeshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.change.tm.changeshop.domain.Img;
import www.change.tm.changeshop.domain.ImgCustom;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.mapper.ImgMapper;
import www.change.tm.changeshop.service.ImgService;

@Service("imgService")
public class ImgServiceImpl implements ImgService {
	@Autowired
	private ImgMapper imgMapper;

	@Override
	public int saveObject(Img entity) {
		// TODO Auto-generated method stub
		return imgMapper.saveObject(entity)
				;
	}

	@Override
	public int updateObject(Img entity) {
		// TODO Auto-generated method stub
		return imgMapper.updateObject(entity);
	}

	@Override
	public int deleteObject(Img entity) {
		// TODO Auto-generated method stub
		return imgMapper.deleteObject(entity);
	}

	@Override
	public int deleteObjectById(Integer id) {
		// TODO Auto-generated method stub
		return imgMapper.deleteObjectById(id);
	}

	@Override
	public ImgCustom getObjectById(Integer id) {
		// TODO Auto-generated method stub
		return imgMapper.getObjectById(id);
	}

	@Override
	public List<ImgCustom> getObjects(QueryVo<ImgCustom> vo) {
		// TODO Auto-generated method stub
		return imgMapper.getObjects(vo);
	}

	@Override
	public Integer getObjectsSize(QueryVo<ImgCustom> vo) {
		return imgMapper.getObjectsSize(vo);
	}

	

	
}
