package com.oracle.web.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean;
import com.oracle.web.service.BookService;
import com.oracle.web.service.UserService;
import com.oracle.web.bean.User;

@Controller
@Scope(value="prototype")
public class UserForegroundHandler {

	private static final String NONE = null;

	@Autowired
	private BookService bookService;

	@Autowired
	private UserService userService;

	// 登录
	@RequestMapping(value = "login2", method = RequestMethod.POST)
	public String UserLogin(@RequestParam(value="userName",required=false) String userName, @RequestParam(value="password",required=false) String password,

	 HttpServletRequest req, HttpSession session) {

		session.setAttribute("qpassword", password);
		
		//System.out.println(password);

		session.setAttribute("quserName", userName);
		
		//System.out.println(userName);

		return "redirect:/userindex.jsp";

	}

	// 登录验证
	@RequestMapping(value = "/yanzhenglg", method = RequestMethod.POST)
	public String YanZheng(@RequestParam(value="quserName",required=false) String userName, @RequestParam(value="password",required=false) String password,

			HttpServletRequest req, HttpServletResponse resp) throws IOException {

		User a = new User();

		a.setUserName(userName);

		a.setPassword(password);

		User user = userService.login(a);

		if (user == null) {

			resp.getWriter().write("{\"valid\":\"false\"}");

		}

		if (!user.getPassword().equals(a.getPassword())) {

			resp.getWriter().write("{\"valid\":\"false\"}");

		} else {

			resp.getWriter().write("{\"valid\":\"true\"}");

		}

		return NONE;
	}

	// 1.借书
	@RequestMapping(value = "/jieshu", method = RequestMethod.GET)
	public String Jieshu(@RequestParam(value="quserName",required=false) String qusername, @RequestParam(value="password",required=false) String password,

			@RequestParam(value="id",required=false) Integer id,HttpSession session,
			HttpServletResponse resp) {

		//System.out.println(id);

		//System.out.println(id1);

		// System.out.println("借书qusername"+qusername);

		Book book = new Book();

		book.setId(id);

		book.setJieshuren(qusername);

		int b = bookService.jieshu(book);

		session.setAttribute("quserName", qusername);

		session.setAttribute("mag", "借书成功");

		return "redirect:/showBookByPage";
	}

	// 2.还书
	@RequestMapping(value = "/huanshu", method = RequestMethod.GET)
	public String Huanshu(@RequestParam(value="quserName",required=false) String qusername, @RequestParam(value="password",required=false) String password,

			@RequestParam(value="id",required=false) Integer id, HttpSession session,
			HttpServletResponse resp) {

		
		Book book = new Book();

		book.setId(id);

		book.setJieshuren("无");

		int b = bookService.huanshu(book);

		session.setAttribute("quserName", qusername);

		session.setAttribute("mag", "还书成功");

		return "redirect:/showBookByPage";

	}

	// 3.搜索
	@RequestMapping(value = "/showPasgeUsBook", method = RequestMethod.GET)
	public String Show(String url,Integer pageNow,@RequestParam(value="bname") String bname, @RequestParam(value="quserName",required=false) String qusername,
			HttpSession session, HttpServletResponse resp,HttpServletRequest req) throws UnsupportedEncodingException {
		//req.setCharacterEncoding("UTF-8");
		
		url = this.getURL2(req);
		
      // String bname=b.getBname();
		bname=new String(bname.getBytes("iso-8859-1"),"utf-8"); 
	 
	 // b.setBname(new String(bname.getBytes("ISO-8859-1"),"UTF-8"));
	    
       //System.out.println(bname);
	    	
		//System.out.println("===="+url);
		
		// int pageNew=this.getPageNew(req);
		
		if (pageNow == null || pageNow < 1) {

			pageNow = 1;

		}
       // System.out.println(pageNow);
        
		pageBean<SubBook> pb = bookService.showPesgeUsBook(pageNow,bname);
         
		pb.setUrl(url);
		
	//	System.out.println(pb);
		
		// System.out.println("搜索qusername"+qusername);
		session.setAttribute("quserName", qusername);

		session.setAttribute("pb", pb);

		return "redirect:/showQT.jsp";

	}

	 private String getURL2(HttpServletRequest req) {
			
	        String url=this.getURL(req);
			
	      //  System.out.println("---"+url);
	        
	        int index=url.lastIndexOf("&pageNow=");
	        
	        //System.out.println("index=="+index);
		    
		    if(index == -1){
		    	
		    	return url; 
		    	
		    	
		    }else{
		    
			return url.substring(0,index);
		    }
		}

		private String getURL(HttpServletRequest req) {
			
	        String path=req.getContextPath();// LibrarySystem
			
			String servlet=req.getServletPath();// bookByWhere 
			
			String param=req.getQueryString();		
			
			//System.out.println(path+servlet+"?"+param);
			
			return path+servlet+"?"+param;
			
		}
	// 4.分页查看
	@RequestMapping(value = "/showBookByPage", method = RequestMethod.GET)
	public String ShowByPage(Integer pageNow, @RequestParam(value="quserName",required=false) String qusername,

			HttpSession session, HttpServletResponse resp) {

		if (pageNow == null || pageNow < 1) {

			pageNow = 1;

		}

		pageBean<SubBook> pb = bookService.showAllByPage(pageNow);

		String q1 = (String) session.getAttribute("quserName");

		if (q1 != null) {

			session.setAttribute("quserName", q1);

		} else {

			session.setAttribute("quserName", qusername);
		}

		session.setAttribute("pb", pb);
		// resp.sendRedirect("showBook.jsp");

		return "redirect:/userForeground.jsp";

	}

}
