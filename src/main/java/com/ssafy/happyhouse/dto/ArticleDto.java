package com.ssafy.happyhouse.dto;

public class ArticleDto {

	private int articleno;
	private String userid;
	private String subject;
	private String content;
	private String regtime;

	public ArticleDto() {}
	
	public ArticleDto(int articleno, String userid, String subject, String content, String regtime) {
		super();
		this.articleno = articleno;
		this.userid = userid;
		this.subject = subject;
		this.content = content;
		this.regtime = regtime;
	}

	public int getarticleno() {
		return articleno;
	}

	public void setarticleno(int articleno) {
		this.articleno = articleno;
	}

	public String getuserid() {
		return userid;
	}

	public void setuserid(String userid) {
		this.userid = userid;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

	@Override
	public String toString() {
		return "GuestBookDto [articleno=" + articleno + ", userid=" + userid + ", subject=" + subject + ", content="
				+ content + ", regtime=" + regtime + "]";
	}
	

}
