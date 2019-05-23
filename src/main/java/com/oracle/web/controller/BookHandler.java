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

import com.oracle.web.bean.Book;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean;
import com.oracle.web.service.BookService;
import com.oracle.web.service.FenleiService;

@Controller
@Scope(value = "prototype")
public class BookHandler {

	@Autowired
	private BookService bookService;

	@Autowired
	private FenleiService fenleiService;

//	@RequestMapping(value = "/books", method = RequestMethod.GET)
//	public String Books(HttpServletRequest request) {
//
//		List<Book> bList = bookService.list();
//
//		request.setAttribute("bList", bList);
//
//		return "showBook2";
//	}

	@RequestMapping(value = "/addUI", method = RequestMethod.GET)
	public String addUI(HttpServletRequest request) {

		List<Fenlei> list = fenleiService.list();

		request.setAttribute("list", list);

		return "addBook";
	}

	@RequestMapping(value = "/book", method = RequestMethod.POST)
	public String add(Book book) {

		int i = bookService.save(book);

		return "redirect:/books";
	}

	@RequestMapping(value = "/book/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") Integer id) {

		Book book = new Book();

		book.setId(id);

		bookService.delete(book);

		return "redirect:/books";
	}
	
	@RequestMapping(value = "/book/{id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("id") Integer id, HttpSession session) {
		
		Book book = bookService.queryOneBook(id);

		session.setAttribute("book", book);	
		
		List<Fenlei> flist = fenleiService.list();

		session.setAttribute("flist", flist);

		return "redirect:/updateBook.jsp";
	}

	@RequestMapping(value = "/book", method = RequestMethod.PUT)
	public String update(Book book) {

		bookService.update(book);
		
		return "redirect:/books";
	}
	
	@RequestMapping(value="/books",method=RequestMethod.GET)
	public String selectFY(Integer pageNow,HttpServletRequest req){
		
		if (pageNow == null || pageNow < 1) {

			pageNow = 1;

		}
		
		pageBean<SubBook> pb=bookService.showAllByPage(pageNow);
				
		req.setAttribute("pb", pb);

		return "showBook2";
		
	}

}
