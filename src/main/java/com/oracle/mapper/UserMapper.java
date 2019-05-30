package com.oracle.mapper;

import com.oracle.web.bean.User;

import java.util.List;

public interface UserMapper {

	List<User> selectAll();

	int insert(User user);

	int deleteByPrimaryKey(Integer id);

	void updateByPrimaryKey(User user);

	User selectByPrimaryKey(Integer id);

	List<User> selectAllBypage();

	List<User> selectBypage(int index);

	int selectCount();
	
    int insertTouxiang(User user);

	
	
}