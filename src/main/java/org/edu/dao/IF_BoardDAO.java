package org.edu.dao;

import java.util.List;

import org.edu.vo.BoardVO;
import org.edu.vo.PageVO;

//public -> 누구나 접근 가능하도록 하는 메서드,  void -> 리턴값이 없을 때 사용
// <> -> 제네릭 타입
// insert, update는 자료양이 많아서 VO에 보내서 받음
// select는 리턴값이 없어서 매개변수x
// delete는 특정 id만 삭제해야하기 때문에 use_id로 지정

public interface IF_BoardDAO {
	public void insertBoard(BoardVO boardVO) throws Exception;
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception;
	public void updateBoard(BoardVO boardVO) throws Exception;
	public void deleteBoard(Integer bno) throws Exception;
	public BoardVO viewBoard(Integer bno) throws Exception;
	public void insertAttach(String fullName) throws Exception;
	public List<String> selectAttach(Integer bno) throws Exception;
	public void deleteAttach(Integer bno) throws Exception;
	public void updateAttach(String fullName, Integer bno) throws Exception;
	public int countBno(PageVO pageVO) throws Exception;
	public void updateViewCount(Integer bno) throws Exception;
}