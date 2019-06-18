package com.oracle.web.bean;

import java.io.Serializable;

public class SubBook extends Book implements Serializable{

	// 拓展自己的属性
	public Fenlei fenlei;

	public Fenlei getFenlei() {
		return fenlei;
	}

	public void setFenlei(Fenlei fenlei) {
		this.fenlei = fenlei;
	}

	@Override
	public String toString() {
		return "SubBook [fenlei=" + fenlei + "]";
	}

}
