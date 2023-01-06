package org.igo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RequestVO {
	
	private int rn;
	private int rid; //의뢰번호
	private String name; //이름
	private String phone; //연락처
	private String addr; //연락처
	private String addr2; //연락처
	private String category; //분류
	private String content; //내용
	private String hopeDate; //희망일자
	private int fid; //기사번호
	private int price; //기사번호
	private String regDate; //등록일
	private String updateDate; //수정일
	private String acceptDate; //접수일
	private String status; //상태
	private int score; //평점
	
}
