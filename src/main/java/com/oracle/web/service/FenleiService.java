package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Fenlei;

public interface FenleiService {

	List<Fenlei> list();

	int save(Fenlei fenlei);

	int delete(Fenlei fenlei);

	//int queryOneFenlei(Fenlei fenlei);

	Fenlei queryOneFenlei(Integer id);

	void update(Fenlei fenlei);

	//Fenlei queryOneFenlei1(Integer id);

}
