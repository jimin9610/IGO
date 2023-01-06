package org.igo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AskVO {
	
	private int rn;
	private int aid; //문의번호
	private String name; //이름
	private String phone; //연락처
	private String ask; //문의내용
	private String regDate; //등록일
	private String updateDate; //수정일
	private String status; //답변유무
	private int fid; //기사코드
	
}
