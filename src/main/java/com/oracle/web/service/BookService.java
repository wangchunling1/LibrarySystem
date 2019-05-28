package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.PageBean;

public interface BookService {

	List<Book> list();

	int save(Book book);

	void delete(Book book);

	PageBean<Book> selectAllPage(Integer pageNow);

}
