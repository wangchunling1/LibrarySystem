package com.oracle.web.service;

import java.util.List;



import org.springframework.web.multipart.MultipartFile;

import com.oracle.web.bean.pageBean;

import com.oracle.web.bean.User;

public interface UserService {

	int addUser(User user);

	User selectOne(Integer id);

       void delete(String ids);

      void   updateTouxiang(User user);

	void updateUser(User user);

	pageBean<User> showByPage(Integer pageNow);

	List<User> outPutUserAll();

	List<User> outPutUserIds(String ids);

	User validateUser(String userName);

	

	






 
	
}
