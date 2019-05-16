package com.oracle.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.mapper.UserMapper;
import com.oracle.web.bean.User;
import com.oracle.web.service.UserService;

public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	
	@Override
	@Transactional
	public List<User> list() {
		// TODO Auto-generated method stub
		return this.userMapper.list();
	}


	@Override
	@Transactional
	public int save(User user) {
		// TODO Auto-generated method stub
		return this.userMapper.save();
	}


	@Override
	@Transactional
	public int delete(User user) {
		// TODO Auto-generated method stub
	return 	this.userMapper.deleteByPrimaryKey(user.getId());
		
	}


	@Override
	@Transactional
	public User queryOneUser(Integer id) {
		// TODO Auto-generated method stub
		return this.userMapper.updateByPrimaryKey(id);
		
	}

	
	
	
	
	
}
