package org.igo.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {

		//필드(=멤버변수=인스턴스 변수)
		private int pageNum; //현재 페이지 번호
		private int amount; //한 페이지 당 보여지는 행수
		
		private String type;
		
		public Criteria() { //기본 생성자
			
			this(1,10,""); //매개변수 2개 생성자 호출
			
		}
		
		public Criteria(int pageNum, int amount, String type) {
			
			this.pageNum = pageNum;
			this.amount = amount;
			this.type = type;
		}

		public String getListLink() {
			
			UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
					.queryParam("pageNum", this.pageNum)
					.queryParam("amount", this.getAmount());
			return builder.toUriString();
			
		}
}
