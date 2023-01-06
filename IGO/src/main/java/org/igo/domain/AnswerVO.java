package org.igo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AnswerVO {

	private int ansId; //답변 번호
	private int aid; //문의번호
	private int fid; //기사번호
	private String answer; //답변내용
	private String regDate; //등록일
	
}
