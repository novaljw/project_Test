package com.min.edu.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.min.edu.dto.Member_Dto;

@Repository
public class Member_DaoImpl implements Member_IDao {


	private final String NS = "com.min.edu.model.Member_IDao.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public List<Member_Dto> memList() {
		return sqlSession.selectList(NS+"memberList");
	}

	@Override
	public boolean signupMember(Member_Dto dto) {
		
		// 12345678 -> 암호화 시키면?
		String enPassword = passwordEncoder.encode(dto.getPw());
		System.out.printf("============= %s ============ \n", enPassword);
		dto.setPw(enPassword);
		int cnt =  sqlSession.insert(NS+"signupMember", dto);
		return (cnt>0)?true:false;
		
	}

	@Override
	public boolean idDuplicateCheck(String id) {
		int cnt = sqlSession.selectOne(NS+"idDuplicateCheck", id);
		return  (cnt>0)?true:false;
	}

	@Override
	public Member_Dto loginMember(Map<String, Object> map) {
//		System.out.println("로그인 실행 중");
//		return sqlSession.selectOne(NS+"loginMember", map);
		
		System.out.println("암호화 로그인 실행 중");
		Member_Dto mDto = null;
		System.out.printf("화면에서 전달받은 요청 값 :  %s ============ \n", map.get("pw"));
		String enPw = passwordEncoder.encode((String)map.get("pw"));
		System.out.printf("전달받은 값 암호화 :  %s ============ \n", enPw);
		
		String dbPw = sqlSession.selectOne(NS+"selStringPw", map.get("id"));
		System.out.printf("DB에 입력되어 있는 값 :  %s ============ \n", dbPw);
		
		
		// 전받 받은 값을 Spring security로 암호화 하면 항상 다른 값으로 암호화 됨
		// 따라서 DB입력된 값과 비교 하기 위해서 PasswordEncoder 클래스의 match를 사용해서 비교 판단 해야 함
		if(passwordEncoder.matches((String)map.get("pw"), dbPw)) {
			System.out.println("=======비밀번호 일치");
			mDto = sqlSession.selectOne(NS+"enLogin", map);
		}
		
		return mDto;
	}

}




