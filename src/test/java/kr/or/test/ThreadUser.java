package kr.or.test;

//A extends B = B에 A가 상속됨
class MovieThread extends Thread {
	@Override //변수를 재정의
	public void run() {
		for(int cnt=0; cnt<3; cnt++) {
			System.out.println("동영상을 재생합니다");
		}
		while(true) {
			System.out.println("동영상을 무한 재생함");
			/*try {
				Thread.sleep(1);
			} catch (Exception e) {
				break; 
			}*/
			//스레드=실행중인 클래스가 main()에서 interrupt()가 호출되었을 때
			if(Thread.interrupted()) { //interrupted = main에서 interrupt시킨 것에 대한 이벤트
				System.out.println("인터럽트가 발생되었습니다. 반복문을 종료함");
				break; //while문 빠져나가기
			}
		}
	}
}
//A implements B = B를 A에서 구현함
class MusicRunnable implements Runnable {
	@Override
	public void run() {
		for(int cnt=0; cnt<3; cnt++) {
			System.out.println("음악을 재생합니다");
		}
	}
}
	
public class ThreadUser {

	public static void main(String[] args) {
		Thread threadMovie = new MovieThread(); //초기값을 MovieThread라는 클래스에서 가져옴
		threadMovie.setDaemon(true); //백그라운드로 실행설정
		threadMovie.start();
		
		//main() 스레드에서 1초 후 threadMovie를 종료하는 코드
		try {
			Thread.sleep(3000); //main스레드는 3초간 중지되어도 threadMovie는 계속 실행
		} catch (InterruptedException e) {
		}	threadMovie.interrupt(); //threadMovie도 중지하겠다는 메서드 실행
		
		
		Thread threadMusic = new Thread(new MusicRunnable());
		threadMusic.start();
	}

}
