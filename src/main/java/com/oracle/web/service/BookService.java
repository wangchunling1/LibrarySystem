package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean;

public interface BookService {

	List<Book> list();

	int save(Book book);

	void delete(Book book);

	Book queryOneBook(Integer id);

	void update(Book book);

	pageBean<SubBook> showAllByPage(Integer pageNow);

	Book queryOne(String bname);

	List<Book> showBookByIds(String[] arr);

}
