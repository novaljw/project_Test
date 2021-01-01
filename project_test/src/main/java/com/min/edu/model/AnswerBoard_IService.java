package com.min.edu.model;

import java.util.List;
import java.util.Map;

import com.min.edu.dto.Answerboard_Dto;

public interface AnswerBoard_IService {

	public List<Answerboard_Dto> selectDynamic(Map<String, String> map);

	public Answerboard_Dto selectDetailBoard(String seq);
	
	// 답글 입력 트랜젝션
	public boolean reply(Answerboard_Dto dto);
	
	public boolean modifyBoard(Map<String, Object> map);
	
	public boolean insertBoard(Answerboard_Dto dto);
	
	public boolean multiDelete(String[] seqs);

	public boolean multiDelete2(Map<String, String[]> map);
	
}
