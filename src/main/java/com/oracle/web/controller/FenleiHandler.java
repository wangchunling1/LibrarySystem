package com.oracle.web.controller;

import java.util.List;
import com.oracle.web.bean.Fenlei;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.web.service.FenleiService;

@Controller
@Scope(value = "prototype")
public class FenleiHandler {
	
	@Autowired
	private FenleiService fenleiService;
	
	@RequestMapping(value = "/fenlei", method = RequestMethod.GET)
	
	public String Fenlei(HttpServletRequest request) {

		List<Fenlei> fList = fenleiService.list();

		request.setAttribute("fList", fList);

		return "showFenlei";
	}
	

}
