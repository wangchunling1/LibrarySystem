package com.oracle.mapper;

import org.apache.ibatis.annotations.Param;

import com.oracle.web.bean.Admin;



public interface AdminMapper {

	
	int save(Admin admin);//保存
	
	Admin login(String userName);//登录
	
	Admin queryOne(String userName);//单个查询
	
	Admin selectByPrimaryKey(String userName);//查看管理员

	Admin queryByPassword(Admin admin);//密码
	
	//修改密码

	Admin changePassword(@Param("userName") String userName, @Param("password") String newpassword);
	
	
	
	

}