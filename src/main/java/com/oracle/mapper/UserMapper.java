package com.oracle.mapper;

import com.oracle.web.bean.User;
import com.oracle.web.bean.UserExample;

import java.util.List;

public interface UserMapper {


	User selectByPrimaryKey(Integer id);

	List<User> selectOutPutAll();

	List<User> selectOutPutIds(List<Integer> list);

	User selectValidate(String userName);

	int insert(User user);

	int  deleteByExample(UserExample example);

	int selectCount();

	List<User> showByPage(int index);

	int updateByPrimaryKey(User user);







	
   

	
	
}