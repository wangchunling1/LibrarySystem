package com.oracle.web.service;

import java.util.List;


import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.User;

public interface UserService {

	int save(User user);

	void update(User user);

	void delete(User u);

	User queryOneUser(Integer id);

	PageBean<User> selectAllPage(Integer pageNow);

	List<User> list();

	PageBean<User> selectByPage(Integer pageNow, int pageSize);

	void updateTouxiang(User user);

	int saveTouxiang(User user);



 
	
}
