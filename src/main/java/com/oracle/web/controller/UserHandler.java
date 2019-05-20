package com.oracle.web.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.web.bean.User;
import com.oracle.web.service.UserService;
import com.oracle.web.bean.PageBean;


@Controller
@Scope(value = "prototype")
public class UserHandler {
	private static final String NONE = null;
	@Autowired
	private UserService userService;
//1.添加用户
	@RequestMapping(value = "/add", method=RequestMethod.GET)

	public String add(User  user) {

		
		userService.save(user);

		return "redirect:/monsters";

	}
	
	
	
	
	
//2.修改用户
	@RequestMapping(value= "/user", method=RequestMethod.PUT)
	public String update(User user) {

		userService.update(user);
		 System.out.println(user);
		return "redirect:/users";

	}
//3.删除用户
	@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") Integer id1) {

		User u = new User();

		u.setId(id1);

		userService.delete(u);

		return "redirect:/users";
	}
//4.单查
	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("id") Integer id, HttpSession session) {

		User user = userService.queryOneUser(id);

		session.setAttribute("u", user);

		

		return "redirect:/updateUser.jsp";
               
	}
//	@RequestMapping(value="/login",method=RequestMethod.POST)
//	public  String login(User user){
//		
//		User user1=this.userService.login(user);
//          if(user1==null){
//    		
//    		return "redirect:/userlogin.jsp";
//    	}
//    	
//    	if(!user1.getPassword().equals(user.getPassword())){
//    		
//    		return "redirect:/userlogin.jsp";
//    	}
//  	  
//    	return "redirect:/zhuce.jsp";
//		
//	}
	//5.查看用户
	@RequestMapping(value = "/users", method = RequestMethod.GET)
   	public String list(Integer pageNow ,HttpServletRequest request) {
       	
   		if(pageNow==null||pageNow<1){
   			
   			pageNow=1;
   			
   		}
   		PageBean <User>  pb =userService.selectAllPage(pageNow);

   		//System.out.println(pb);

   		request.setAttribute("pb", pb);

   		return "showUser";

 }
}
