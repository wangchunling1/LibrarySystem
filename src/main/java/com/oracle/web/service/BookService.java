package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Book;

public interface BookService {

	List<Book> list();

	int save(Book book);

	void delete(Book book);

}
