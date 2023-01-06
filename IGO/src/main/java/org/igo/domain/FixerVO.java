package org.igo.domain;

import java.io.File;

import lombok.Data;

@Data
public class FixerVO {

	private int fid; //기사번호
	private String fname; //이름
	private String password; //비밀번호
	private String fphone; //연락처
	private String profile; //프로필사진
	private String regDate; //등록일
	private String updateDate; //수정일
	
}
