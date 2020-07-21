package org.edu.dao;

import java.util.List;

import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;

//public -> 누구나 접근 가능하도록 하는 메서드,  void -> 리턴값이 없을 때 사용
// <> -> 제네릭 타입
// insert, update는 자료양이 많아서 VO에 보내서 받음
// select는 리턴값이 없어서 매개변수x
// delete는 특정 id만 삭제해야하기 때문에 use_id로 지정

public interface IF_MemberDAO {
	public void insertMember(MemberVO memberVO) throws Exception;
	public List<MemberVO> selectMember(PageVO pageVO) throws Exception;
	public void updateMember(MemberVO memberVO) throws Exception;
	public void deleteMember(String user_id) throws Exception;
	public MemberVO viewMember(String user_id) throws Exception;
	public int countUserId(PageVO pageVO) throws Exception;
}