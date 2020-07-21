package kr.or.member;

import java.io.IOException;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import org.apache.commons.net.ntp.NTPUDPClient;
import org.apache.commons.net.ntp.TimeInfo;

import kr.or.member.MemberService;
import kr.or.member.MemberVO;

public class MainController {

	// 서버시간 가져오기 MainCotroller 클래스 내용 중 시작
	private static final String TIME_SERVER = "pool.ntp.org";

	public static void main(String[] args) throws IOException {
		System.out.println("클래스형 변수 - 사용자정의 자료형");
		// MemberVO 클래스를 실행하기위해 new연산자 사용
		MemberVO m1 = new MemberVO();
		// setter 메서드를 이용해 해당 객체(instance) 변수에 값을 입력
		m1.setName("김혜진");
		m1.setAge(45);
		m1.setPhoneNum("000-0000-9026");
		// 마찬가지로 다른 MemberVO 객체(instance)를 생성해서 변수에 값을 입력
		MemberVO m2 = new MemberVO();
		m2.setName("김혜진");
		m2.setAge(100);
		m2.setPhoneNum("111-2222-9026");
		MemberVO m3 = new MemberVO();
		m3.setName("김혜진");
		m3.setAge(3);
		m3.setPhoneNum("222-2222-9026");

		// 크기가 3인 MemberVO클래스를 배열객체로 선언하면서 new연산자를 이용해 객체로 생성
		MemberVO[] members = new MemberVO[3];
		// MemberVO[]배열클래스 index에 m1,m2,m3을 넣음
		members[0] = m1;
		members[1] = m2;
		members[2] = m3;
		// 출력은 MemberService 클래스를 사용
		MemberService ms = new MemberService();
		ms.printMembers(members);

		/* MainControl 클래스에 아래 내용 추가하 후 에러 상황 처리하기를 이용해서 외부 라이브러리 사용방법 확인 */
		System.out.println("-서버타임 출력하기-");
		NTPUDPClient timeClient = new NTPUDPClient();
		timeClient.setDefaultTimeout(1000);
		try {
			timeClient.open();
		} catch (SocketException e) {
			System.out.println("open메서드 실행 오류");
			e.printStackTrace();
		}
		InetAddress address = InetAddress.getByName(TIME_SERVER);
		TimeInfo timeInfo = timeClient.getTime(address);
		// 서버로부터 시간 가져오는 코드
		long returnTime = timeInfo.getMessage().getTransmitTimeStamp().getTime();
		Date date = new Date(returnTime);
		LocalDateTime localDateTime = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime(); // date to
																											// LocalDateTime

		System.out.println("Server 시간: " + localDateTime); // 서버 시간!
		System.out.println("로컬 PC 시간: " + LocalDateTime.now());

	}

}
