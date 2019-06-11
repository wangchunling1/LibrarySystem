package com.oracle.web.bean;

import java.util.Date;

public class User {

	private Integer id;
	
	private String touxiang;
	
	private String name;

	private String userName;

	private String password;

	private String phone;

	private String time;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTouxiang() {
		return touxiang;
	}

	public void setTouxiang(String touxiang) {
		this.touxiang = touxiang == null ? null : touxiang.trim();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getPassword() {
		return password;
	}

	public String getUserName() {
		return userName;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", touxiang=" + touxiang + ", name=" + name + ", userName=" + userName + ", password="
				+ password + ", phone=" + phone + ", time=" + time + "]";
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public User() {
		super();
		this.userName = userName;
	}


	

	public User(Integer id) {
		super();
		this.id = id;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getPhone() {
		return phone;
	}

	public User(Integer id, String touxiang, String name, String userName, String password, String phone,String time) {
		super();
		this.id = id;
		this.touxiang = touxiang;
		this.name = name;
		this.userName = userName;
		this.password = password;
		this.phone = phone;
		this.time = time;
	}

	

	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	public User(String time) {
		super();
		this.time = time;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	

	
	
	

	
}