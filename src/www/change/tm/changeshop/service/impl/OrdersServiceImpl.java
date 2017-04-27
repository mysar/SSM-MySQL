package www.change.tm.changeshop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import www.change.tm.changeshop.domain.QueryVo;
import www.change.tm.changeshop.domain.Orders;
import www.change.tm.changeshop.domain.OrdersCustom;
import www.change.tm.changeshop.mapper.OrdersMapper;
import www.change.tm.changeshop.service.OrdersService;

@Service("ordersService")
public class OrdersServiceImpl implements OrdersService {

	private OrdersMapper ordersMapper;

	@Resource
	public void setOrdersMapper(OrdersMapper ordersMapper) {
		this.ordersMapper = ordersMapper;
	}

	@Override
	public int saveObject(Orders entity) {
		return ordersMapper.saveObject(entity);
	}

	@Override
	public int updateObject(Orders entity) {
		return ordersMapper.updateObject(entity);
	}

	@Override
	public int deleteObject(Orders entity) {
		//return OrdersMapper.deleteObject(entity);
		return 0;
	}

	@Override
	public int deleteObjectById(Integer id) {
		return ordersMapper.deleteObjectById(id);
	}

	@Override
	public OrdersCustom getObjectById(Integer id) {
		return ordersMapper.getObjectById(id);
	}

	@Override
	public List<OrdersCustom> getObjects(QueryVo<OrdersCustom> vo) {
		return ordersMapper.getObjects(vo);
	}

	@Override
	public Integer getObjectsSize(QueryVo<OrdersCustom> vo) {
		return ordersMapper.getObjectsSize(vo);
	}

}
