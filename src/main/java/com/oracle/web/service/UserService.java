package com.oracle.web.service;

import java.util.List;


import com.oracle.web.bean.User;

public interface UserService {

	List<User> list();

   int save(User user);

  int delete(User user);

 User queryOneUser(Integer id);


 
	
}
