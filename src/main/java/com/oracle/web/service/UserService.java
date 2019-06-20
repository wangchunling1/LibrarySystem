package com.oracle.web.service;

import java.util.List;



import org.springframework.web.multipart.MultipartFile;

import com.oracle.web.bean.pageBean;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.User;

public interface UserService {

	int addUser(User user);

	User selectOne(Integer id);

       //void delete(String ids);

      void   updateTouxiang(User user);

	void updateUser(User user);

	pageBean<User> showByPage(Integer pageNow);

	User validateUser(String userName);

	void delete1(String[] arr);

	List<User> queryUsers(String[] arr);

	List<User> list2();

	User login(User a);

}
