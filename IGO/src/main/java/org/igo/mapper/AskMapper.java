package org.igo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.igo.domain.AskVO;
import org.igo.domain.Criteria;
import org.igo.domain.RequestVO;

public interface AskMapper {
	
//	문의 접수
	public void insert(AskVO ask);
	
//	문의 리스트
	public List<AskVO> getList();
	
//	문의 불러오기
	public AskVO read(int aid);
	
//	로그인
	public String login(@Param("name") String name,@Param("phone") String phone);
	
//	문의 수정하기
	public void update(AskVO ask);	
	
//	페이징 처리
	public List<AskVO> getListWithPaging(@Param("cri") Criteria cri ,@Param("name") String name,@Param("phone") String phone);
	
//	전체 행수 구하기
	public int getTotalCount(Criteria cri,@Param("name") String name,@Param("phone") String phone);
}
