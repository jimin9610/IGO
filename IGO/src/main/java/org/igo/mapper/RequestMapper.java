package org.igo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.igo.domain.Criteria;
import org.igo.domain.RequestVO;

public interface RequestMapper {
	
//	의뢰 접수
	public void insert(RequestVO request);
	
//	의뢰 목록
	public List<RequestVO> getList();
	
//	의뢰 상세보기
	public RequestVO read(int rid);
	
//	로그인
	public String login(@Param("name") String name,@Param("phone") String phone);
	
//	의뢰 취소
	public void cancel(int rid);
	
//	의뢰 수정하기
	public void update(RequestVO request);
	
//	의뢰 수정하기(접수)
	public void accept(RequestVO request);
	
//	의뢰 수정하기(결제)
	public void pay(RequestVO request);
	
//	페이징 처리
	public List<RequestVO> getListWithPaging(@Param("cri") Criteria cri ,@Param("name") String name,@Param("phone") String phone);
	
//	전체 행수 구하기
	public int getTotalCount(@Param("cri") Criteria cri ,@Param("name") String name,@Param("phone") String phone);

}
