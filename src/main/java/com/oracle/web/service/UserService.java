package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.pageBean;
import com.oracle.web.bean.User;

public interface UserService {

	int save(User user);

	void update(User user);

	void delete(User u);

	User queryOneUser(Integer id);

	pageBean<User> selectAllPage(Integer pageNow);

	List<User> list();

	pageBean<User> selectByPage(Integer pageNow, int pageSize);



 
	
}
