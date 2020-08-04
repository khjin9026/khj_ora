package org.edu.service;

import java.util.List;

import javax.inject.Inject;

import org.edu.dao.IF_BoardDAO;
import org.edu.dao.IF_ReplyDAO;
import org.edu.vo.BoardTypeVO;
import org.edu.vo.BoardVO;
import org.edu.vo.PageVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements IF_BoardService {

	@Inject
	private IF_BoardDAO boardDAO;
	
	@Transactional //insert가 2개일때 처리해주는 것. 오류날시 다시 rollback해줌
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
		//첨부파일용 서비스추가
		String[] files = boardVO.getFiles();
		if(files == null) { return; }
		for(String fileName : files) {
			boardDAO.insertAttach(fileName, boardDAO.selectTopBno());
		}
	}

	@Override
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception {
		return boardDAO.selectBoard(pageVO);
	}
	
	@Transactional
	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		boardDAO.updateBoard(boardVO);
		//첨부파일용 서비스추가
		String[] files = boardVO.getFiles();
		Integer bno = boardVO.getBno(); //tbl_attach 테이블 수정용 변수
		if(files == null) { return; }
		boardDAO.deleteAttach(bno); //기존 첨부파일 내용 삭제
		for(String fileName : files) {
			boardDAO.updateAttach(fileName, bno);//신규 첨부파일 내용 입력
		}
	}
	
	//스프링에서 알아서 오류가 날시 rollback(원상복귀)처리해줌 
	@Transactional
	@Override
	public void deleteBoard(Integer bno) throws Exception {
		boardDAO.deleteBoardReply(bno); //DB에서 delete cascade로 알아서 지워주긴하나, 혹 오류날걸 방지해 안전하게 처리하기 위해 추가
		boardDAO.deleteAttach(bno);
		boardDAO.deleteBoard(bno);
	}

	@Override
	public BoardVO viewBoard(Integer bno) throws Exception {
		boardDAO.updateViewCount(bno);
		return boardDAO.viewBoard(bno);
	}

	@Override
	public List<String> selectAttach(Integer bno) throws Exception {
		return boardDAO.selectAttach(bno);
	}

	@Override
	public int countBno(PageVO pageVO) throws Exception {
		return boardDAO.countBno(pageVO);
	}

	@Override
	public List<BoardTypeVO> selectBoardType() throws Exception {
		return boardDAO.selectBoardType();
	}

	@Override
	public void deleteBoardType(String bod_type) throws Exception {
		boardDAO.deleteBoardType(bod_type);
	}

	@Override
	public void updateBoardType(BoardTypeVO boardTypeVO) throws Exception {
		boardDAO.updateBoardType(boardTypeVO);
	}

	@Override
	public void insertBoardType(BoardTypeVO boardTypeVO) throws Exception {
		boardDAO.insertBoardType(boardTypeVO);
	}

	@Override
	public BoardTypeVO viewBoardType(String bod_type) throws Exception {
		return boardDAO.viewBoardType(bod_type);
	}

}