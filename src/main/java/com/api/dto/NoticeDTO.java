package com.api.dto;

import java.sql.Date;

public class NoticeDTO {

	private int notice_no;
	private int type;
	private int post_no;
	private String content;
	private Date notice_date;
	private String from_id;
	private String to_id;
	
	public NoticeDTO() {}

	public NoticeDTO(int notice_no, int type, int post_no, String content, Date notice_date, String from_id,
			String to_id) {
		super();
		this.notice_no = notice_no;
		this.type = type;
		this.post_no = post_no;
		this.content = content;
		this.notice_date = notice_date;
		this.from_id = from_id;
		this.to_id = to_id;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public String getFrom_id() {
		return from_id;
	}

	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}

	public String getTo_id() {
		return to_id;
	}

	public void setTo_id(String to_id) {
		this.to_id = to_id;
	}
	
	
}
