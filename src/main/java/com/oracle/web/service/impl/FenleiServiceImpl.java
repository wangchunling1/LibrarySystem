package com.oracle.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.mapper.FenleiMapper;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.pageBean;
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

	@Override
	public Fenlei queryOne(String name) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.findfenlei(name);
	}

	@Override
	public pageBean<Fenlei> showByPage(Integer pageNow) {
		// TODO Auto-generated method stub
		pageBean<Fenlei> pb = new pageBean<Fenlei>();

		// 当前页的数据
		PageHelper.startPage(pageNow, 5);

		// 已经是分页好的数据了
		List<Fenlei> list = this.fenleiMapper.showByPage();

		pb.setBeanList(list);

		// 总记录数
		PageInfo<Fenlei> pi = new PageInfo<Fenlei>(list);

		pb.setCounts((int) pi.getTotal());

		// 当前页
		pb.setPageNow(pi.getPageNum());

		// 每页显示的条数，自定义
		pb.setPageSize(pi.getPageSize());

		return pb;
	}

	@Override
	public List<Fenlei> showfenleiByIds(String[] arr) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.showfenleiByIds(arr);
	}

	@Override
	public List<Fenlei> showFenleiByIds(String[] arr) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.showfenleiById(arr);
	}

	@Override
	public List<Fenlei> list2() {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectAll2();
	}


}
