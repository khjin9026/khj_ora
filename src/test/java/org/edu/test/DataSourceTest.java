package org.edu.test;

import java.sql.Connection;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.edu.service.IF_MemberService;
import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class DataSourceTest {

	@Inject
	private DataSource ds; //데이터소스 클래스를 ds라는 변수로 지정
	
	@Inject
	private IF_MemberService memberService;
	
	@Test
	public void testConnection() throws Exception {
		Connection con = ds.getConnection(); //파라미터(매개변수) 없음
		System.out.println("데이터베이스 커넥션 성공 : " + con);
	}
	
	@Test
	public void testDeleteMember() throws Exception {
		memberService.deleteMember("user02");
	}
	
	@Test
	public void testUpdateMember() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setUser_id("user02");
		memberVO.setUser_pw("1234");
		memberVO.setUser_name("김일국");
		memberVO.setEmail("kimilguk@test.com");
		memberVO.setPoint(100);
		memberVO.setEnabled(true);
		memberVO.setLevels("ROLE_ADMIN");
		memberService.updateMember(memberVO);
	}
	
	@Test
	public void testInsertMember() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setUser_id("kimilguk");
		memberVO.setUser_pw("1234");
		memberVO.setUser_name("김일국");
		memberVO.setEmail("kimilguk@test.com");
		memberVO.setPoint(100);
		memberVO.setEnabled(true);
		memberVO.setLevels("ROLE_USER");
		memberService.insertMember(memberVO);
	}
	
	@Test
	public void testSelectMember() throws Exception {
		System.out.println("회원리스트 입니다.");
		PageVO pageVO = new PageVO();
		pageVO.setPage(1);
		pageVO.setPerPageNum(10);
		List<MemberVO> list = memberService.selectMember(pageVO);
		System.out.println(list);
		/*for(MemberVO vo:list) {
			System.out.println("사용자아이디 : " + vo.getUser_id());
			System.out.println("사용자이메일 : " + vo.getEmail());
		}*/
	}
}