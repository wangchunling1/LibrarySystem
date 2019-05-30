package com.oracle.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.GenericServlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.web.bean.Book;
import com.oracle.web.service.BookService;

/**
 * Servlet implementation class OutPutBookServlet
 */
public class OutPutBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
		@Autowired 	
		private BookService bookService;
		
		
}


