package com.api.dto;

import java.sql.Date;

public class MemberDTO {

	private String user_id;
	private String password;
	private String user_nickname;
	private String phone;
	private String email;
	private String address;
	private Date signup_date;
	private String profile_pate;
	private int type;
	private int blacklist;
	
	public MemberDTO() {}

	public MemberDTO(String user_id, String password, String user_nickname, String phone, String email, String address,
			Date signup_date, String profile_pate, int type, int blacklist) {
		super();
		this.user_id = user_id;
		this.password = password;
		this.user_nickname = user_nickname;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.signup_date = signup_date;
		this.profile_pate = profile_pate;
		this.type = type;
		this.blacklist = blacklist;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getSignup_date() {
		return signup_date;
	}

	public void setSignup_date(Date signup_date) {
		this.signup_date = signup_date;
	}

	public String getProfile_pate() {
		return profile_pate;
	}

	public void setProfile_pate(String profile_pate) {
		this.profile_pate = profile_pate;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getBlacklist() {
		return blacklist;
	}

	public void setBlacklist(int blacklist) {
		this.blacklist = blacklist;
	}

	@Override
	public String toString() {
		return "MemberDTO [user_id=" + user_id + ", password=" + password + ", user_nickname=" + user_nickname
				+ ", phone=" + phone + ", email=" + email + ", address=" + address + ", signup_date=" + signup_date
				+ ", profile_pate=" + profile_pate + ", type=" + type + ", blacklist=" + blacklist + "]";
	}
	
	
}
