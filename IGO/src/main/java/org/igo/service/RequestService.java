package org.igo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.igo.domain.Criteria;
import org.igo.domain.FixerVO;
import org.igo.domain.RequestVO;

public interface RequestService {
	
//	의뢰 접수
	public void insert(RequestVO request);
	
//	의뢰 목록
	public List<RequestVO> getList();
	
//	의뢰 상세보기
	public RequestVO read(int rid);
	
//	로그인
	public String login(String name, String phone);
	
//	의뢰 취소
	public void cancel(int rid);
	
//	의뢰 수정하기
	public void update(RequestVO request);
	
//	의뢰 수정하기(결제)
	public void pay(RequestVO request);

//	의뢰 수정하기
	public void accept(RequestVO request);
	
//	의뢰 페이징 처리
	public List<RequestVO> getRListWithPaging(Criteria cri,String name,String phone);
	
//	전체 행수 구하기
	public int getTotalCount(Criteria cri,String name,String phone);

}
