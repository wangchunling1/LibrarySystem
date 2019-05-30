package com.oracle.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.GenericServlet;
import javax.servlet.ServletContext;
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

import com.oracle.web.bean.Book;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean;
import com.oracle.web.service.BookService;
import com.oracle.web.service.FenleiService;

@Controller
@Scope(value = "prototype")
public class BookHandler {

	private static final String NONE = null;
	
	private String filename;//页面传过来的文件名

	private String contentType;//文件MIME类型
	
	private long contentLength;//文件的大小
	
	private String contentDisposition;//下载弹出的信息
	
	private InputStream inputStream;//一个输入流

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

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

	@RequestMapping(value = "validate")
	@ResponseBody
	public String queryByBname(String bname,HttpServletResponse response) throws IOException{

		System.out.println(bname);

		Book b =bookService.queryOne(bname);

		response.setContentType("text/html;charset=utf-8");

        if(b!=null){
			
            response.getWriter().write("{\"valid\":\"false\"}");
		
			}else{
				
				response.getWriter().write("{\"valid\":\"true\"}");//不存在
			}
		
		return NONE;

	}
	@RequestMapping(value = "/addUI", method = RequestMethod.GET)
	public String addUI(HttpServletRequest request) {

		List<Fenlei> fList = fenleiService.list();
        //System.out.println(fList);
		//request.setAttribute("fList", fList);
        
        request.getSession().setAttribute("fList", fList);

		return "redirect:/addBook.jsp";
	}

	@RequestMapping(value = "/book", method = RequestMethod.POST)
	public String add(Book book) {

		bookService.save(book);

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
	
	List<Book> list = null;

	String key = "";

	private GenericServlet ServletActionContext;
	
	@RequestMapping(value="/all",method=RequestMethod.GET)
	public String All(){
		
		list = bookService.list();
		
		return "redirect:/books";
	}
	
	@RequestMapping(value="/select",method=RequestMethod.GET)
	public String Select(String ids, HttpServletRequest request){
		
		String[] arr = ids.split(",");

		list = bookService.showBookByIds(arr);

		return "redirect:/books";
	}


	@RequestMapping(value="/down")
	public String download() throws FileNotFoundException, UnsupportedEncodingException{
		
		ServletContext context=ServletActionContext.getServletContext();
		
		contentType=context.getMimeType(filename);
		
		String path=context.getRealPath("/downloads/"+filename);
		
		path=new String(path.getBytes("ISO-8859-1"),"UTF-8");
		
		System.out.println(path);
		
		contentLength=new File(path).length();
		
		contentDisposition="attachment;filename="+filename;
		
		inputStream = new FileInputStream(path);
		
		return "books";
	}
   

}
