package kr.or.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Calendar;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class OpenApi {
	//API -> 응용 프로그램에서 사용할 수 있도록 운영 체제 혹은 프로그래밍 언어에 제공하는 인터페이스(공유정보)
	//외부연계 매서드
	public static void serviceApi() {
		BufferedReader br = null; //HRD넷에서 전송받은 데이터를 일시저장하는 저수지역할
		String urlstr = "http://www.hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp?returnType=XML"
						+ "&authKey=인증키부분&pageNum=1&pageSize=10"
						+ "&srchTraStDt=20200501&srchTraEndDt=20201231&outType=1&sort=DESC&sortCol=TR_STT_DT&srchTraArea1=44";
		                //링크를 보기 편하게 하기위해 분리
		try {
			URL url= new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET"); // 데이터 전송 방식 GET -> 정보를 가져와 조회할 때 주로 사용
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"euc-kr"));
			//api 인코딩을 위해 "euc-kr" 입력 -> 받아오는 api에 따라 달라질 수 있음
			String result = "";
			String line;
			while((line = br.readLine()) != null) {
				result = result + line + "\n";
				//1부터 100까지 더하는 로직과 같음(반복문while)
			}
			//System.out.println(result);
			String result_xmlUtils = XmlUtils.formatXml(result);
			System.out.println(result_xmlUtils);
			
		} catch (MalformedURLException e) { //URL에 대한 catch
			e.printStackTrace();
		} catch (IOException e) { //openConnection에 대한 catch
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//콘솔에 현재 PC시간 표시
		Calendar cal = Calendar.getInstance();
		System.out.println(cal.getTime());
	}
	public static void main(String[] args) {
		//실행간격 지정 5초
		int sleepSec = 5;
		//주기적인 작업을 위한 코딩 -> exec 실행가능한 클래스를 만듦
		final ScheduledThreadPoolExecutor exec = new ScheduledThreadPoolExecutor(1);
		exec.scheduleAtFixedRate(new Runnable() {
			public void run() {
				serviceApi();
			}
		}, 0, sleepSec, TimeUnit.SECONDS);
		//serviceApi();
		
	}

}

 //배치 프로그램, 스케줄 프로그램 -> 일괄처리