package com.min.edu.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.dto.Answerboard_Dto;
import com.min.edu.dto.Member_Dto;
import com.min.edu.model.AnswerBoard_IService;

@Controller
public class AnswerBoard_Controller {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//TODO : 변수명을 쓸 때는 정확한 용도와 출처를 반영한 이름을 쓰자
	@Autowired 
	private AnswerBoard_IService aiService;
	
	// 전체글 보기
	@RequestMapping(value = "/boardList.do", method = RequestMethod.GET)
	public String boardList(Model model) {
		List<Answerboard_Dto> lists = aiService.selectDynamic();
		model.addAttribute("lists", lists);
		
		//TODO : 로거 찍기 
		System.out.println("AnswerBoard_Controller 작동 - boardList 이동");
		return "boardList";
	}
	
	// 상세글 보기
	@RequestMapping(value = "/detailboard.do", method = RequestMethod.GET)
	public String detailboard(Model model, @RequestParam String seq) {
		Answerboard_Dto detail = (Answerboard_Dto)aiService.selectDetailBoard(seq);
		model.addAttribute("detail", detail);
		System.out.println("AnswerBoard_Controller 작동 - detailboard 이동");
		return "detailboard";
	}
	
	// 글 쓰기 이동
	@RequestMapping(value = "/insertboard.do", method = RequestMethod.GET)
	public String insertboard() {
		
		System.out.println("AnswerBoard_Controller 작동 - insertboard 이동");
		return "insertboard";
	}
	
	// 작성글 등록
	@RequestMapping(value = "/postWrite.do", method = RequestMethod.POST)
	public String postWrite(Answerboard_Dto dto, HttpSession session) {
		System.out.println(dto.getId());
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		Member_Dto mDto = (Member_Dto)session.getAttribute("mem");
		dto.setId(mDto.getId());
		
		aiService.insertBoard(dto);
		
		System.out.println("AnswerBoard_Controller 작동 - postWrite 글등록");
		return "redirect:/detailboard.do?seq="+dto.getSeq();
	}
	
	// 글 수정하기 
	@RequestMapping(value = "/modifyBoard.do", method = RequestMethod.POST)
	public String modifyBoard(Answerboard_Dto dto, Model model) {
		System.out.println("상세글 seq : "+ dto.getSeq());
		System.out.println("상세글 아이디 id : "+ dto.getId());
		System.out.println("상세글 제목 title : "+ dto.getTitle());
		System.out.println("상세글 내용 content : "+ dto.getContent());
		
		int seq = dto.getSeq();
		String id = dto.getId();
		String title = dto.getTitle();
		String content = dto.getContent();
		
		model.addAttribute("seq", seq);
		model.addAttribute("id", id);
		model.addAttribute("title", title);
		model.addAttribute("content", content);
		
		System.out.println("AnswerBoard_Controller 작동 - modifyBoard 이동");
		return "modifyBoard";
	}
	
	
	// 수정글 등록
	@RequestMapping(value = "/modifyRegist.do", method = RequestMethod.POST)
	public String modifyRegist(Answerboard_Dto dto, HttpSession session) {
		logger.info("welcome modifyRegist.do : \t {}" , dto);
		
		// 로그인된 사용자 정보 
		Member_Dto mDto = (Member_Dto)session.getAttribute("mem");
		dto.setId(mDto.getId());
		
		return aiService.modifyBoard(dto)?
		"redirect:/detailboard.do?seq="+dto.getSeq():"redirect:/modifyBoard.do";
	}
	
	// 답글 입력
	@RequestMapping(value = "/reply.do", method = RequestMethod.POST)
	public String reply(Answerboard_Dto dto, HttpSession session) {
		logger.info("welcome reply.do : \t {}" , dto);
		
		// 로그인된 사용자 정보 
		Member_Dto mDto = (Member_Dto)session.getAttribute("mem");
		dto.setId(mDto.getId());
		
		return aiService.reply(dto)?
		"redirect:/boardList.do":"redirect:/detailboard.do?seq="+dto.getSeq();
	}
	
	// 다중삭제 multiDel
	@RequestMapping(value = "/multiDel.do", method = RequestMethod.POST)
	public String multiDel(@RequestParam String[] ch) { 
		logger.info("welcome DeleteBoard.do : \t {}", ch );
		
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("seqs", ch);
		
		for (String string : ch) {
			System.out.println("전달받은 값 : " + string);
		}
		aiService.multiDelete2(map);
		
		return "redirect:/boardList.do";
	}
	
	// 단일 삭제 DeleteBoard
	@RequestMapping(value = "/DeleteBoard.do", method = RequestMethod.POST)
	public String DeleteBoard(@RequestParam String[] seq) { 
		return multiDel(seq);
	}
	
	
}
