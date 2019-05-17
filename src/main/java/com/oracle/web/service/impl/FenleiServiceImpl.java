package com.oracle.web.service.impl;



import org.springframework.stereotype.Service;

import com.oracle.web.bean.Fenlei;
import com.oracle.web.service.FenleiService;

@Service
public class FenleiServiceImpl implements FenleiService {

	private FenleiMapper fenleiMapper;

	@Override
	@Transactional(readOnly = true)
	public List<Fenlei> list() {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectAll();
	}

}
