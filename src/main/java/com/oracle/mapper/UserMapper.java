package com.oracle.mapper;

import com.oracle.web.bean.User;
import com.oracle.web.bean.UserExample;

import java.util.List;

public interface UserMapper {


	User selectByPrimaryKey(Integer id);

	User selectValidate(String userName);

	int insert(User user);

	int  deleteByExample(UserExample example);

	int selectCount();

	List<User> showByPage();

	int updateByPrimaryKey(User user);

	int deleteByPrimaryKey(String[] arr);

	List<User> queryUsers(String[] arr);

	List<User> selectAll2();







	
   

	
	
}