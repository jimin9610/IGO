package org.igo.service;

import java.util.List;

import org.igo.domain.AnswerVO;
import org.igo.domain.AskVO;
import org.igo.domain.FixerVO;
import org.igo.mapper.AnswerMapper;
import org.igo.mapper.AskMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AnswerServiceImpl implements AnswerService{
	
	private AnswerMapper mapper;

	@Override
	public void insert(AnswerVO answer) {

		mapper.insert(answer);
		
	}

	@Override
	public AnswerVO read(int aid) {
		
		return mapper.read(aid);
		
	}

	@Override
	public void update(AnswerVO answer) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void done(AskVO askVO) {

		mapper.done(askVO);
		
	}

	@Override
	public List<FixerVO> fixerRead() {

		return mapper.fixerRead();
	}


}
