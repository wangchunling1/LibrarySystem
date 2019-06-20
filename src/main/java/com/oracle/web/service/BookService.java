package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean;

public interface BookService {

	List<Book> list();

	int save(Book book);

	//void delete(Book book);

	Book queryOneBook(Integer id);

	void update(Book book);

	pageBean<SubBook> showAllByPage(Integer pageNow);

	Book queryOne(String bname);

	List<Book> queryBooks(String[] arr);

	List<Book> list2();

	void delete1(String[] arr);

	pageBean<SubBook> selectAllByPageAndWhere(Book where, int pageNow);

	int jieshu(Book book);

	int huanshu(Book book);

	pageBean<SubBook> showPesgeUsBook(Integer pageNow, String bname);
	

}
