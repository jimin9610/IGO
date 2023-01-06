package org.igo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.igo.domain.Criteria;
import org.igo.domain.DoneVO;
import org.igo.domain.FixListVO;
import org.igo.domain.FixerVO;
import org.igo.domain.RequestVO;

public interface FixerService {
	
//	신규 기사 등록
	public void add(FixerVO fixerVo);

//	로그인
	public int login(String fname, String password);
	
//	의뢰 목록
	public List<RequestVO> getList();
	
//	의뢰접수
	public void accept(int fid, int rid);
	
//	기사 정보 불러오기
	public List<FixerVO> read();
	
//	기사 평점 불러오기
	public double score(int fid);
	
//	기사 정보 불러오기(업데이트)
	public FixerVO infoRead(int fid);
	
//	기사 정보 업데이트
	public void updateFixer(FixerVO fixerVo);
	
//	수리 완료 처리
	public void doneRequest(int rid);
	
//	수리 카테고리 불러오기
	public List<DoneVO> cat(int rid);
	
//	수리 내역 등록
	public void insert(FixListVO fixListVO);
	
//	수리 내역 불러오기
	public List<DoneVO> done(int rid);
	
//	수리 내역 삭제
	public void delete(FixListVO fixListVO);
	
//	페이징 처리
	public List<RequestVO> getRListWithPaging(Criteria cri);
	
//	전체 행수 구하기
	public int getRTotalCount(Criteria cri);
	
//	페이징 처리
	public List<RequestVO> getAListWithPaging(Criteria cri);
	
//	전체 행수 구하기
	public int getATotalCount();
	
//	페이징 처리
	public List<RequestVO> getFListWithPaging(Criteria cri,int fid);
	
//	전체 행수 구하기
	public int getFTotalCount(Criteria cri,int fid);
}
