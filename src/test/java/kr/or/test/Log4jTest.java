package kr.or.test;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.apache.log4j.Logger;
 //logger level : debug < info < warn < error < fatal

public class Log4jTest {
	private Logger log = Logger.getLogger(Log4jTest.class);
	public void test( ) {
		MemberVO memberVO = new MemberVO();
		memberVO.setName("가가가");
		memberVO.setAge(999);
		try { //spring 프로젝트가 아니라 throws가 아닌 try-catch로 예외처리
			InetAddress localPC = InetAddress.getLocalHost();
			String ip = localPC.getHostAddress();
			log.info("test라는 메서드를 사용한 pc아이피는 " + ip);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		log.debug("디버그!!" + memberVO);
		log.info("인포!!");
		log.warn("워닝!!");
		log.error("에러!!");
		log.fatal("파탈에러!!");
	}
	public static void main(String[] args) {
		new Log4jTest().test();

	}

}
