package com.oracle.web.service;

import com.oracle.web.bean.Admin;

public interface AdminService {

	int save(Admin admin);

	Admin queryOne(String username);

	Admin login(Admin admin);

}
