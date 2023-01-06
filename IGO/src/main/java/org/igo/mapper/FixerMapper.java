package org.igo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.igo.domain.Criteria;
import org.igo.domain.DoneVO;
import org.igo.domain.FixListVO;
import org.igo.domain.FixerVO;
import org.igo.domain.RequestVO;
import org.junit.runners.Parameterized.Parameters;

import lombok.experimental.PackagePrivate;

public interface FixerMapper {
	
//	신규 기사 등록
	public void add(FixerVO fixerVo);

//	로그인
	public int login(@Param("fname") String fname,@Param("password") String password);
	
//	의뢰 목록
	public List<RequestVO> getList();
	
//	의뢰접수
	public void accept(@Param("fid") int fid,@Param("rid") int rid);
	
//	기사 정보 불러오기
	public List<FixerVO> read();
	
//	기사 평점 불러오기
	public double score(@Param("fid") int fid);
	
//	기사 정보 불러오기(업데이트)
	public FixerVO infoRead(int fid);
	
//	기사 정보 업데이트
	public void updateFixer(FixerVO fixerVo);
	
//	수리 완료 처리
	public void doneRequest(@Param("rid") int rid);
	
//	수리 카테고리 불러오기
	public List<DoneVO> cat(@Param("rid") int rid);
	
//	수리 내역 등록
	public void insert(FixListVO fixListVO);
	
//	수리 내역 불러오기
	public List<DoneVO> done(@Param("rid") int rid);
	
//	수리 내역 삭제
	public void delete(FixListVO fixListVO);
	
//	페이징 처리
	public List<RequestVO> getRListWithPaging(@Param("cri") Criteria cri);
	
//	전체 행수 구하기
	public int getRTotalCount(@Param("cri") Criteria cri);
	
//	페이징 처리
	public List<RequestVO> getAListWithPaging(@Param("cri") Criteria cri);
	
//	전체 행수 구하기
	public int getATotalCount();
	
//	페이징 처리
	public List<RequestVO> getFListWithPaging(@Param("cri") Criteria cri,@Param("fid") int fid);
	
//	전체 행수 구하기
	public int getFTotalCount(@Param("cri") Criteria cri,@Param("fid") int fid);
}
