package com.code.jutsu.entities;

import java.sql.Timestamp;

public class User {
	private int id;
	private String name;
	private String email;
	private String password;
	private String about;
	private Timestamp reg_date;
	private String profile;
	
	public User(int id, String name, String email, String password, String about, Timestamp reg_date) {
		
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.about = about;
		this.reg_date = reg_date;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public User() {
		
	}
	public User(String name, String email, String password, String about) {
		
		this.name = name;
		this.email = email;
		this.password = password;
		this.about = about;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
//	getters and setters
	
	
	
	
	

}
