package com.min.edu.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.dto.Answerboard_Dto;

@Repository
public class AnswerBoard_DaoImpl implements AnswerBoard_IDao {

	
	private final String NS = "com.min.edu.model.AnswerBoard_IDao.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Answerboard_Dto> selectDynamic() {
		List<Answerboard_Dto> list = null;
		list = sqlSession.selectList(NS+"selectDynamic");
		return list;
	}

	@Override
	public Answerboard_Dto selectDetailBoard(String seq) {
		Answerboard_Dto dto = sqlSession.selectOne(NS+"selectDetailBoard", seq);
		return dto;
	}
	
	@Override
	public boolean replyInsert(Answerboard_Dto dto) {
		int cnt = sqlSession.insert(NS+"replyInsert", dto);
		return cnt>0?true:false;
	}

	@Override
	public boolean replyUpdate(Answerboard_Dto dto) {
		int cnt = sqlSession.update(NS+"replyUpdate", dto);
		return cnt>0?true:false;
	}

	@Override
	public boolean modifyBoard(Answerboard_Dto dto) {
		int cnt = sqlSession.update(NS+"modifyBoard", dto);
		return cnt>0?true:false;
	}

	@Override
	public boolean insertBoard(Answerboard_Dto dto) {
		int cnt = sqlSession.insert(NS+"insertBoard", dto);
		return cnt>0?true:false;
	}


	@Override
	public boolean multiDelete2(Map<String, String[]> seqs) {
		int cnt = sqlSession.update(NS+"multiDelete2", seqs);
		return cnt>0?true:false;
	}

	

	

}
