package com.oracle.web.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.web.bean.pageBean;
import com.oracle.web.bean.UserExample.Criteria;
import com.oracle.mapper.UserMapper;
import com.oracle.web.bean.User;
import com.oracle.web.bean.UserExample;
import com.oracle.web.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	
	
//分页
	@Override
	@Transactional
	public pageBean<User> showByPage(Integer pageNow) {
		pageBean<User> pb = new pageBean<User>();
		
		PageHelper.startPage(pageNow,5);
		
		List<User> list = this.userMapper.selectBypage();
		
		pb.setBeanList(list);
		// 查看有多少条
		PageInfo<User> pi = new PageInfo<User>(list);
		
		pb.setCounts((int)pi.getTotal());
		
		pb.setPageNow(pi.getPageNum());
		
		pb.setPageSize(pi.getPageSize());

		return pb;

	}

	
//添加
	@Override
	@Transactional
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return this.userMapper.insert(user);
		
	}
//单查
	@Override
	@Transactional
	public User selectOne(Integer id) {
		// TODO Auto-generated method stub
		return this.userMapper.selectByPrimaryKey(id);
	}
//删除
	@Override
	@Transactional
	public void delete(String ids) {
		// TODO Auto-generated method stub

		String[] a = ids.split(",");

		Integer[] values = new Integer[a.length];
		for (int i = 0; i < a.length; i++) {

			values[i] = Integer.parseInt(a[i]);
		}
		
		UserExample example = new UserExample();
		
		Criteria criteria = example.createCriteria();
		
		criteria.andIdIn(Arrays.asList(values));
		
		this.userMapper.deleteByExample(example);
	}
//修改
	@Override
	@Transactional
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		this.userMapper.updateUserByPrimaryKey(user);
	}
//导出
	@Override
	@Transactional
	public List<User> outPutUserAll() {
		// TODO Auto-generated method stub
	return this.userMapper.selectOutPutAll();
	}

	@Override
	@Transactional
	public List<User> outPutUserIds(String ids) {
		// TODO Auto-generated method stub
		
		String[] a = ids.split(",");
		 
		 List<Integer> list =new ArrayList<Integer>();
		 for (int i = 0; i < a.length; i++) {
	           
				list.add(Integer.parseInt(a[i]));
				 
			}
		return this.userMapper.selectOutPutIds(list);
	}
	
//验证
	@Override
	@Transactional
	public User validateUser(String userName) {
		// TODO Auto-generated method stub
		return this.userMapper.selectValidate(userName);
	}


//修改头像
	@Override
	@Transactional
	public void updateTouxiang(User user) {
		// TODO Auto-generated method stub
		this.userMapper.updateTouxiangByPrimaryKey(user);
	}

}
