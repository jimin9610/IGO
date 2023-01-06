package org.igo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.igo.domain.Criteria;
import org.igo.domain.FixerVO;
import org.igo.domain.RequestVO;
import org.igo.mapper.FixerMapper;
import org.igo.mapper.RequestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RequestServiceImpl implements RequestService{
	
	private RequestMapper mapper;

	@Override
	public void insert(RequestVO request) {

		mapper.insert(request);
		
	}
	
	@Override
	public List<RequestVO> getList() {
		
		return mapper.getList();
	}

	@Override
	public RequestVO read(int rid) {

		return mapper.read(rid);
	}

	@Override
	public void update(RequestVO request) {

		mapper.update(request);
		
	}
	
	@Override
	public void accept(RequestVO request) {
		
		mapper.accept(request);
		
	}

	@Override
	public List<RequestVO> getRListWithPaging(Criteria cri,String name,String phone) {
		
		return mapper.getListWithPaging(cri, name, phone);
	}

	@Override
	public int getTotalCount(Criteria cri,String name,String phone) {
		
		return mapper.getTotalCount(cri, name, phone);
	}

	@Override
	public String login(String name, String phone) {
		// TODO Auto-generated method stub
		return mapper.login(name, phone);
	}

	@Override
	public void cancel(int rid) {

		mapper.cancel(rid);
		
	}

	@Override
	public void pay(RequestVO request) {

		mapper.pay(request);
		
	}

	

	
}
