package com.oracle.web.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.web.service.FenleiService;
import com.oracle.web.bean.Fenlei;
@Controller
@Scope(value = "prototype")
public class FenleiHandler {
	private static final String NONE = null;
	
	private static String fl;
	
	
	
	@Autowired
	private FenleiService fenleiService;
	
	@RequestMapping(value = "/fenleis", method = RequestMethod.GET)
	
	public String Fenlei(HttpServletRequest request) {

		List<Fenlei> fList = fenleiService.list();

		request.setAttribute("fList", fList);

		return "showFenlei";
	}
	
	@RequestMapping(value = "validate")
	@ResponseBody
	public String queryByBname(String name,HttpServletResponse response) throws IOException{

		System.out.println(name);

		Fenlei f =fenleiService.queryOne(name);

		response.setContentType("text/html;charset=utf-8");

        if(f!=null){
			
            response.getWriter().write("{\"valid\":\"false\"}");
		
			}else{
				
				response.getWriter().write("{\"valid\":\"true\"}");//不存在
			}
		
		return NONE;

	}
	
	
	
	

	@RequestMapping(value = "add",method = RequestMethod.POST)
	public String add(Fenlei fenlei){
		
		int i = fenleiService.save(fenlei);
		
		return "redirect:/fenleis";
			
	}
	
	@RequestMapping(value = "/fenlei/{id}",method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") Integer id){
		
		Fenlei fenlei = new Fenlei();
		
		fenlei.setId(id);
		
		int i = fenleiService.delete(fenlei);
		
		return "redirect:/fenleis";
		
		
	}
	
	@RequestMapping(value = "/fenlei/{id}",method = RequestMethod.GET)
	public String updateUI(@PathVariable("id") Integer id,HttpSession session){
		
		Fenlei fenlei = fenleiService.queryOneFenlei(id);
		
		session.setAttribute("fenlei", fenlei);
		
		return "redirect:/updateFenlei.jsp";
		
		
	}
	
	@RequestMapping(value = "/fenlei", method = RequestMethod.PUT)
	public String update(Fenlei fenlei) {

		fenleiService.update(fenlei);

		return "redirect:/fenleis";
	}

	
	

}
