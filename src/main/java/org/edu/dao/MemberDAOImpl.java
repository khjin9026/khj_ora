package org.edu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;
import org.springframework.stereotype.Repository;

//implements -> extends와 비슷하지만 IF와 매칭시킬 때 사용
@Repository
public class MemberDAOImpl implements IF_MemberDAO {
	//Static -> 정적 메서드, 한 번 사용 후 다시 쓸일 x
	private static String mapperQuery = "org.edu.dao.IF_MemberDAO";
	
	@Inject
	private SqlSession sqlSession; 
	
	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		sqlSession.insert(mapperQuery + ".insertMember", memberVO);
	}
	// .insert(앞 -> 쿼리문, 뒤 -> 매개변수);

	@Override
	public List<MemberVO> selectMember(PageVO pageVO) throws Exception {
		return sqlSession.selectList(mapperQuery + ".selectMember", pageVO);
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		sqlSession.update(mapperQuery + ".updateMember", memberVO);
	}

	@Override
	public void deleteMember(String user_id) throws Exception {
		sqlSession.delete(mapperQuery + ".deleteMember", user_id);
		
	}

	@Override
	public MemberVO viewMember(String user_id) throws Exception {
		return sqlSession.selectOne(mapperQuery + ".viewMember", user_id);
	}

	@Override
	public int countUserId(PageVO pageVO) throws Exception {
		return sqlSession.selectOne(mapperQuery + ".countUserId", pageVO);
	}

}