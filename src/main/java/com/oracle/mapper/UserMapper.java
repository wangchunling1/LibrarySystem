package com.oracle.mapper;

import com.oracle.web.bean.User;


import com.oracle.web.bean.UserExample;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface UserMapper {

	

	void deleteByExample(UserExample example);

	int selectCounts();

	void updateUserByPrimaryKey(User user);

	List<User> selectBypage();


	User selectByPrimaryKey(Integer id);

	List<User> selectOutPutAll();

	List<User> selectOutPutIds(List<Integer> list);

	void updateTouxiangByPrimaryKey(User user);

	User selectValidate(String userName);

	int insert(User user);




	
   

	
	
}