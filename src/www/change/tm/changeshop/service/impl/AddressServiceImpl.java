package www.change.tm.changeshop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.change.tm.changeshop.domain.Address;
import www.change.tm.changeshop.domain.AddressCustom;
import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.mapper.AddressMapper;
import www.change.tm.changeshop.service.AddressService;
@Service("addressService")
public class AddressServiceImpl implements AddressService{
	@Autowired
	private AddressMapper addressMapper;
	@Resource
	public void setAddressMapper(AddressMapper addressMapper) {
		this.addressMapper = addressMapper;
	}
	@Override
	public int saveObject(Address entity) {
		// TODO Auto-generated method stub
		return addressMapper.saveObject(entity);
	}

	@Override
	public int updateObject(Address entity) {
		// TODO Auto-generated method stub
		return addressMapper.updateObject(entity);
	}

	@Override
	public int deleteObject(Address entity) {
		// TODO Auto-generated method stub
		return addressMapper.deleteObject(entity);
	}

	@Override
	public int deleteObjectById(Integer id) {
		// TODO Auto-generated method stub
		return addressMapper.deleteObjectById(id);
	}

	@Override
	public Address getObjectById(Integer id) {
		// TODO Auto-generated method stub
		return addressMapper.getObjectById(id);
	}

	@Override
	public List<AddressCustom> getObjects(QueryVo<AddressCustom> vo) {
		// TODO Auto-generated method stub
		return addressMapper.getObjects(vo);
	}

	@Override
	public Integer getObjectsSize(QueryVo<AddressCustom> vo) {
		// TODO Auto-generated method stub
		return addressMapper.getObjectsSize(vo);
	}

}
