package com.oracle.mapper;

import com.oracle.web.bean.User;

import java.util.List;

public interface UserMapper {
	List<User> list();

	int save();

	int deleteByPrimaryKey(Integer id);

	User updateByPrimaryKey(Integer id);

	
	
}