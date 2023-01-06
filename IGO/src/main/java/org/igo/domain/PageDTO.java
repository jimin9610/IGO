package org.igo.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PageDTO {
	
	private int startPage; //화면 하단 시작번호
	private int endPage; //화면 하단 종료번호
	private boolean prev, next; //이전, 이후 버튼
	
	private int total; //총 페이지 수
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		//cri.getPageNum() : 현재 표시된 페이지 번호
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		//실제 마지막 페이지 계산
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		//실제 페이지 수가 만약 마지막 페이지 수보다 작으면
		if(realEnd < this.endPage) {
			
			this.endPage = realEnd;
			
		}
		
		//이전페이지 존재 여부 체크
		this.prev = this.startPage > 1;
		//다음페이지 존재여부 체크
		this.next = this.endPage < realEnd;
	}
	

}
