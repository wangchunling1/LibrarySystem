package com.oracle.web.service;

import com.oracle.web.bean.Admin;

public interface AdminService {

	int save(Admin admin);

	Admin queryone(String userName);

	Admin login(Admin admin);

}
