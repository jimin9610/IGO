package org.igo.service;

import java.util.List;

import org.igo.domain.Criteria;
import org.igo.domain.DoneVO;
import org.igo.domain.FixListVO;
import org.igo.domain.FixerVO;
import org.igo.domain.RequestVO;
import org.igo.mapper.FixerMapper;
import org.igo.mapper.RequestMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FixerServiceImpl implements FixerService{
	
	private FixerMapper mapper;
	
	private RequestMapper r_mapper;

	@Override
	public void add(FixerVO fixerVo) {

		mapper.add(fixerVo);
		
	}
	
	@Override
	public int login(String fname, String password) {
		
		int fid = mapper.login(fname, password);
		
		System.out.println(fid);
		
		return fid;
	}

	@Override
	public List<FixerVO> read() {
		
		return mapper.read();
	}

	@Override
	public void updateFixer(FixerVO fixerVo) {

		mapper.updateFixer(fixerVo);
		
	}
	@Override
	public List<RequestVO> getList() {
		
		return mapper.getList();
	}

	@Override
	public void accept(int fid, int rid) {
		
		mapper.accept(fid, rid);
		
	}

	@Override
	public FixerVO infoRead(int fid) {

		return mapper.infoRead(fid);
		
	}
	
	@Override
	public void doneRequest(int rid) {
		
		mapper.doneRequest(rid);
		
	}

	@Override
	public void insert(FixListVO fixListVO) {

		mapper.insert(fixListVO);
		
	}

	@Override
	public List<DoneVO> cat(int rid) {

		return mapper.cat(rid);
	}

	@Override
	public List<DoneVO> done(int rid) {

		return mapper.done(rid);
		
	}

	@Override
	public void delete(FixListVO fixListVO) {

		mapper.delete(fixListVO);
		
	}

	@Override
	public double score(int fid) {
		
		return mapper.score(fid);
	}

	@Override
	public List<RequestVO> getRListWithPaging(Criteria cri) {

		return mapper.getRListWithPaging(cri);
		
	}

	@Override
	public int getRTotalCount(Criteria cri) {

		return mapper.getRTotalCount(cri);
		
	}

	@Override
	public List<RequestVO> getAListWithPaging(Criteria cri) {

		return mapper.getAListWithPaging(cri);
	}

	@Override
	public int getATotalCount() {

		return mapper.getATotalCount();
		
	}

	@Override
	public List<RequestVO> getFListWithPaging(Criteria cri, int fid) {

		return mapper.getFListWithPaging(cri, fid);
		
	}

	@Override
	public int getFTotalCount(Criteria cri,int fid) {
		
		return mapper.getFTotalCount(cri,fid);
		
	}

	
	
}
