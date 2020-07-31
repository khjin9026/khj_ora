package org.edu.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;
//클래스 바로 안쪽에 있는 변수 -> 멤버변수
public class BoardVO {
	private Integer bno;
	@NotBlank(message="게시물 제목은 필수 입력사항입니다")
	private String title;
	@NotBlank(message="게시물 내용은 필수 입력사항입니다")
	private String content;
	private String writer;
	private Date regdate;
	private Date update_date;
	private int view_count;
	private int reply_count;
	private String bod_type;
	private Integer rnum; //오라클전용 rownum 행번호 필드 get-set
	
	//데이터베이스용 get-set
	public String getBod_type() {
		return bod_type;
	}
	public void setBod_type(String bod_type) {
		this.bod_type = bod_type;
	}
	private String[] files;//첨부파일용 변수 추가
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", update_date=" + update_date + ", view_count=" + view_count + ", reply_count="
				+ reply_count + "]";
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public Integer getRnum() {
		return rnum;
	}
	public void setRnum(Integer rnum) {
		this.rnum = rnum;
	}
	
	
	
}