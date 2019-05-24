package com.oracle.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletContext;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


public class DownLoadHandler {
	
	@RequestMapping(value = "/downLoad", method = RequestMethod.GET)
	public String download() throws FileNotFoundException, UnsupportedEncodingException{
		
//		ServletContext context=ServletActionContext.getServletContext();
//		
//		contentType=context.getMimeType(filename);
//		
//		String path=context.getRealPath("/downloads/"+filename);
//		
//		path=new String(path.getBytes("ISO-8859-1"),"UTF-8");
//		
//		System.out.println(path);
//		
//		contentLength=new File(path).length();
//		
//		contentDisposition="attachment;filename="+filename;
//		
//		inputStream = new FileInputStream(path);
		
		return null;
	}
}