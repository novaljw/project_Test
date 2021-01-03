package com.min.edu.model;

import java.util.List;
import java.util.Map;

import com.min.edu.dto.Member_Dto;

public interface Member_IService {

	// 전체회원 조회
	public List<Member_Dto> memList();

	// 회원가입
	public boolean signupMember(Member_Dto dto);

	// 아이디 중복 체크
	public boolean idDuplicateCheck(String id);

	// 로그인
	public Member_Dto loginMember(Map<String, Object> map);
}
