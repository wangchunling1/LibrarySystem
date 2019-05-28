package com.oracle.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.mapper.FenleiMapper;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.service.FenleiService;

@Service
public class FenleiServiceImpl implements FenleiService {

	@Autowired
	private FenleiMapper fenleiMapper;

	@Override
	@Transactional(readOnly = true)
	public List<Fenlei> list() {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectAll();
	}

	@Override
	public int save(Fenlei fenlei) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.insert(fenlei);
	}

	@Override
	public int delete(Fenlei fenlei) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.deleteByPrimaryKey(fenlei.getId());
	}


//	@Override
//	public int queryOneFenlei(Fenlei fenlei) {
//		// TODO Auto-generated method stub
//		return this.fenleiMapper.selectByPrimaryKey(fenlei);
//	}

	@Override
	public Fenlei queryOneFenlei(Integer id) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectByPrimaryKey(id);
	}

	@Override
	public void update(Fenlei fenlei) {
		// TODO Auto-generated method stub
		
		this.fenleiMapper.updateByPrimaryKey(fenlei);
		
	}

}
