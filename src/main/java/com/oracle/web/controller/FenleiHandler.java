package com.oracle.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import com.oracle.web.bean.Fenlei;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.web.service.FenleiService;

import javax.servlet.GenericServlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.web.bean.pageBean;

@Controller
@Scope(value = "prototype")
public class FenleiHandler {
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
	private FenleiService fenleiService;
	
//	@RequestMapping(value = "/fenleis", method = RequestMethod.GET)
//	
//	public String Fenlei(HttpServletRequest request) {
//
//		List<Fenlei> fList = fenleiService.list();
//
//		request.setAttribute("fList", fList);
//
//		return "showFenlei";
//	}
	
	@RequestMapping(value = "validate")
	@ResponseBody
	public String queryByBname(String name,HttpServletResponse response) throws IOException{

		//System.out.println(name);

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

	@RequestMapping(value="/fenleis",method=RequestMethod.GET)
	public String selectFY(Integer pageNow,HttpServletRequest req){
		
		if (pageNow == null || pageNow < 1) {

			pageNow = 1;

		}
		
		pageBean<Fenlei> pb=fenleiService.showByPage(pageNow);
				
		req.setAttribute("pb", pb);

		return "showFenlei";
		
	}
	
	List<Fenlei> list = null;

	String key = "";

	private GenericServlet ServletActionContext;
	
	@RequestMapping(value="/all",method=RequestMethod.GET)
	public String All(){
		
		list = fenleiService.list();
		
		return "redirect:/fenleis";
	}
	
	@RequestMapping(value="/select",method=RequestMethod.GET)
	public String Select(String ids, HttpServletRequest request){
		
		String[] arr = ids.split(",");

		list =fenleiService.showfenleiByIds(arr);

		return "redirect:/fenleis";
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
		
		return "fenleis";
	}

}
