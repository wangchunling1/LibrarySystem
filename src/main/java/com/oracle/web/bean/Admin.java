package com.oracle.web.bean;

public class Admin {
	
	private Integer id;
	
	
	private String name;

	
	private String phone;

	
	private String userName;

	
	private String password;


	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Admin(Integer id, String name, String phone, String userName, String password) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.userName = userName;
		this.password = password;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	@Override
	public String toString() {
		return "Admin [id=" + id + ", name=" + name + ", phone=" + phone + ", userName=" + userName + ", password="
				+ password + "]";
	}

	
}