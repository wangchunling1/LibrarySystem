package com.oracle.mapper;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BookMapper {

	//int deleteByPrimaryKey(Integer id);

	int insert(Book record);

	Book selectByPrimaryKey(Integer id);

	List<Book> selectAll();

	int updateByPrimaryKey(Book record);
	
	int selectCounts();

	List<SubBook> showAllByPage();

	Book findBook(String bname);

	List<Book> queryBooks(String[] arr);

	List<Book> selectAll2();

	int deleteByPrimaryKey(String[] arr);

	List<SubBook> selectAllByPageAndWhere(Book where);

	int jieshu(Book book);

	int huanshu(Book book);

	List<SubBook> showPesgeUsBook(String bname);
}