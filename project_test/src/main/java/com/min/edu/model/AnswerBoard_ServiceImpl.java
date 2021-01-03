package com.min.edu.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.min.edu.dto.Answerboard_Dto;


@Service
public class AnswerBoard_ServiceImpl implements AnswerBoard_IService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AnswerBoard_IDao iDao;
	
	@Override
	public List<Answerboard_Dto> selectDynamic() {
		logger.info("전체글 조회 selectDynamic {}");
		return iDao.selectDynamic();
	}

	@Override
	public Answerboard_Dto selectDetailBoard(String seq) {
		logger.info("상세글 조회 selectDetailBoard {}",seq);
		return iDao.selectDetailBoard(seq);
	}
	
	@Transactional
	@Override
	public boolean reply(Answerboard_Dto dto) {
		logger.info("답글입력 reply {}",dto);
		boolean isc1 = iDao.replyUpdate(dto);
		boolean isc2 = iDao.replyInsert(dto);
		return (isc1||isc2)?true:false;
	
	}
	

	@Override
	public boolean modifyBoard(Answerboard_Dto dto) {
		logger.info("글수정 modifyBoard {}",dto);
		return iDao.modifyBoard(dto);
	}

	@Override
	public boolean insertBoard(Answerboard_Dto dto) {
		logger.info("글입력 insertBoard {}",dto);
		return iDao.insertBoard(dto);
	}

	@Override
	public boolean multiDelete(String[] seqs) {
		logger.info("다중삭제",seqs);
		return iDao.multiDelete(seqs);
	}

	@Override
	public boolean multiDelete2(Map<String, String[]> map) {
		logger.info("다중삭제2 multiDelete2 {}",map);
		return iDao.multiDelete2(map);
	}

	

	

	
}
