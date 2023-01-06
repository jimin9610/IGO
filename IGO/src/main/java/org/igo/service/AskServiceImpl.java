package org.igo.service;

import java.util.List;

import org.igo.domain.AskVO;
import org.igo.domain.Criteria;
import org.igo.mapper.AskMapper;
import org.igo.mapper.RequestMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AskServiceImpl implements AskService{

	private AskMapper mapper;
	
	@Override
	public void insert(AskVO ask) {

		mapper.insert(ask);
	
	}

	@Override
	public List<AskVO> getList() {

		return mapper.getList();
		
	}

	
	@Override
	public AskVO read(int aid) {

		return mapper.read(aid);
		
	}

	@Override
	public void update(AskVO ask) {

		mapper.update(ask);
		
	}
	@Override
	public String login(String name, String phone) {
		
		return mapper.login(name, phone);
	}

	@Override
	public List<AskVO> getListWithPaging(Criteria cri, String name, String phone) {
		
		return mapper.getListWithPaging(cri, name, phone);
	}

	@Override
	public int getTotalCount(Criteria cri, String name, String phone) {
		
		return mapper.getTotalCount(cri, name, phone);
	}

}
