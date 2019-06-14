package com.oracle.web.service;

import com.oracle.web.bean.Admin;

public interface AdminService {

	int save(Admin admin);//保存管理员
	
	Admin login(String userName);//登录
	
	Admin queryOne(String userName);//单查管理员
	
	Admin selectByPrimaryKey(String userName);

	Admin queryByPassword(Admin admin);//保存密码
	
    Admin changePassword(String userName,String newpassword);//修改密码


	
}
