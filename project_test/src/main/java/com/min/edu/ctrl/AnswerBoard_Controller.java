package com.min.edu.ctrl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.dto.Answerboard_Dto;
import com.min.edu.model.AnswerBoard_IService;

@Controller
public class AnswerBoard_Controller {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
	private AnswerBoard_IService aiService;
	
	// 전체글 보기
	@RequestMapping(value = "/boardList.do", method = RequestMethod.GET)
	public String boardList(Model model) {
		List<Answerboard_Dto> lists = aiService.selectDynamic();
		model.addAttribute("lists", lists);
		
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
	public String postWrite(Answerboard_Dto dto) {
		System.out.println(dto.getId());
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
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
	public String modifyRegist(Answerboard_Dto dto) {
		logger.info("welcome modifyRegist.do : \t {}" , dto);
		boolean isc=  aiService.modifyBoard(dto);
		
		return isc?"redirect:/detailboard.do?seq="+dto.getSeq():"redirect:/modifyBoard.do";
	}
	
	// 답글 입력
	@RequestMapping(value = "/reply.do", method = RequestMethod.POST)
	public String reply(Answerboard_Dto dto) {
		logger.info("welcome reply.do : \t {}" , dto);
		boolean isc=  aiService.reply(dto);
		
		return isc?"redirect:/boardList.do":"redirect:/detailboard.do?seq="+dto.getSeq();
//		return null;
	}
}
