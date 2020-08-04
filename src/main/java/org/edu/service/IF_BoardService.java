package org.edu.service;

import java.util.List;

import org.edu.vo.BoardTypeVO;
import org.edu.vo.BoardVO;
import org.edu.vo.PageVO;

public interface IF_BoardService {
	public BoardTypeVO viewBoardType(String bod_type) throws Exception;
	public void deleteBoardType(String bod_type) throws Exception;
	public void updateBoardType(BoardTypeVO boardTypeVO) throws Exception;
	public void insertBoardType(BoardTypeVO boardTypeVO) throws Exception;
	public List<BoardTypeVO> selectBoardType() throws Exception;
	public void insertBoard(BoardVO boardVO) throws Exception;
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception;
	public void updateBoard(BoardVO boardVO) throws Exception;
	public void deleteBoard(Integer bno) throws Exception;
	public BoardVO viewBoard(Integer bno) throws Exception;
	public List<String> selectAttach(Integer bno) throws Exception;
	public int countBno(PageVO pageVO) throws Exception;
}