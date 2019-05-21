package com.oracle.web.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.mapper.UserMapper;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.User;
import com.oracle.web.service.UserService;

public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	
	@Override
	@Transactional
	public List<User> list() {
		// TODO Auto-generated method stub
		return this.userMapper.selectAll();
	}


	@Override
	@Transactional
	public int save(User user) {
		// TODO Auto-generated method stub
		return this.userMapper.insert(user);
	}


	@Override
	@Transactional
	public void delete(User user) {
		// TODO Auto-generated method stub
		this.userMapper.deleteByPrimaryKey(user.getId());
		
	}


	@Override
	@Transactional
	public User queryOneUser(Integer id) {
		// TODO Auto-generated method stub
		return this.userMapper.selectByPrimaryKey(id);
		
	}


	@Override
	@Transactional
	public PageBean<User> selectAllPage(Integer pageNow) {
		// TODO Auto-generated method stub
		PageBean<User> pb = new PageBean<User>();
		
		PageHelper.startPage(pageNow,5);
		
		List<User> list=this.userMapper.selectAllBypage();
		
		pb.setBeanList(list);

		PageInfo<User> pi=new PageInfo<User>(list);
		
		pb.setCounts((int) pi.getTotal());
		
		pb.setPageNow(pi.getPageNum());

		pb.setPageSize(5);
		
		return pb;
	}


	@Override
	@Transactional
	public void update(User user) {
		// TODO Auto-generated method stub
		this.userMapper.updateByPrimaryKey(user);
	}

	@Override
	@Transactional
	public PageBean<User> selectByPage(Integer pageNow, int pageSize) {
		PageBean<User> pb = new PageBean<User>();

		pb.setPageNow(pageNow);

		pb.setPageSize(pageSize);
		
		//查看有多少条
		int sum=userMapper.selectCount();
		
		pb.setCounts(sum);
		
		//从第几条开始
		int index=(pageNow-1)*pageSize;
		
		List<User> list=this.userMapper.selectBypage(index);
		
		pb.setBeanList(list);
		
		return pb;
	}
	
	

	
}
