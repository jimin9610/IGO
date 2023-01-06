package org.igo.mapper;

import java.util.List;

import org.igo.domain.AnswerVO;
import org.igo.domain.AskVO;
import org.igo.domain.FixerVO;

public interface AnswerMapper {
	
//	답변 등록
	public void insert(AnswerVO answer);
	
//	답변 등록시 답변완료 처리
	public void done(AskVO askVO);
	
//	답변 수정
	public void update(AnswerVO answer);
	
//	답변 불러오기
	public AnswerVO read(int aid);
	
//	기사 정보 불러오기
	public List<FixerVO> fixerRead();

}
