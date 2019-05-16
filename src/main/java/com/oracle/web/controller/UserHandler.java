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

@Controller
@Scope(value = "prototype")
public class UserHandler {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/addUser", method = RequestMethod.GET)

	public String addUser(HttpServletRequest request) {

		List<User> list = userService.list();

		request.setAttribute("ulist", list);

		return "add";

	}

	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public String add(User user) {

		userService.save(user);

		return "redirect:/users";

	}

	@RequestMapping(value = "/user/{userId}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("userId") Integer id) {

		User u = new User();

		u.setId(id);

		userService.delete(u);

		return "redirect:/users";
	}

	@RequestMapping(value = "/user/{userId}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("userId") Integer id, HttpSession session) {

		User user = userService.queryOneUser(id);

		session.setAttribute("u", user);

		List<User> list = userService.list();

		session.setAttribute("ulist", list);

		return "redirect:/updateUser.jsp";
               
	}

}
