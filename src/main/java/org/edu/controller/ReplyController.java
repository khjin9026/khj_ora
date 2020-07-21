package org.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.edu.service.IF_ReplyService;
import org.edu.vo.PageVO;
import org.edu.vo.ReplyVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * REST API 서비스(댓글 서비스) == REST FULL 서비스
 * @author HU-415
 *
 */
@RestController
@RequestMapping("/reply")
public class ReplyController {
	@Inject
	private IF_ReplyService replyService;
	
	/**
	 * 댓글 삭제 서비스
	 */
	@RequestMapping(value = "/delete/{rno}", method =  RequestMethod.DELETE )
	public ResponseEntity<String> deleteReply(@PathVariable("rno") Integer rno) {
		ResponseEntity<String> entity = null;
		try { //리턴값을 JSON으로 리턴해주기위해 throws안하고 try catch해줌
			replyService.deleteReply(rno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity; //JSON데이터를 jsp페이지로 리턴해줌
	}
	
	
	/**
	 * 댓글 수정 서비스
	 */
	@RequestMapping(value = "/update/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> updateReply(@PathVariable("rno") Integer rno, @RequestBody ReplyVO replyVO) {		
		//requestbody -> 데이터를 JSON으로 받겠다
		ResponseEntity<String> entity = null;
		try { //리턴값을 JSON으로 리턴해주기위해 throws안하고 try catch해줌
			replyVO.setRno(rno);
			replyService.updateReply(replyVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity; //JSON데이터를 jsp페이지로 리턴해줌
	}
	
	
	/**
	 * 댓글 입력 서비스
	 */
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ResponseEntity<String> insertReply(@RequestBody ReplyVO replyVO) {
		
		ResponseEntity<String> entity = null;
		try { //리턴값을 JSON으로 리턴해주기위해 throws안하고 try catch해줌
			replyService.insertReply(replyVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity; //JSON데이터를 jsp페이지로 리턴해줌
	}
	
	/**
	 * 댓글리스트 서비스
	 * @param bno
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/select/{bno}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> selectReply(@PathVariable("page") Integer page, @PathVariable("bno") Integer bno) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		PageVO pageVO = new PageVO();
		pageVO.setPage(page);
		pageVO.setPerPageNum(5);
		pageVO.setTotalCount(replyService.countRno(bno));
		//replyVO리스트(댓글 리스트), pageVO리스트(페이지번호 리스트)
		//Map > HashMap
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("replyList", replyService.selectReply(bno, pageVO));
		resultMap.put("pageVO", pageVO);
		//Map변수 = 데이터형 [{'key':'List<>'},{'key':'Class'},{'':''}, ...]
		try {
			entity = new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}

	
