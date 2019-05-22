package com.oracle.mapper;

import com.oracle.web.bean.Admin;
import java.util.List;

public interface AdminMapper {
	
//	int deleteByPrimaryKey(Integer id);
//
//	
//	Admin selectByPrimaryKey(Integer id);
//
//	
//	List<Admin> selectAll();
//
//	
//	int updateByPrimaryKey(Admin record);

	
	
	int save(Admin admin);

	Admin queryOne(String username);

	Admin login(Admin admin);
}