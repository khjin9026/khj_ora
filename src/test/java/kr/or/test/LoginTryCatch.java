package kr.or.test;

class NotExistIDException extends Exception {
	//ID가 존재하지 않을 때 예외사항 처리내용
	public NotExistIDException() {}
	public NotExistIDException(String message) {
		super(message);
		
	}
}
class WrongPasswordException extends Exception {
	//잘못된 PW를 입력했을 때 예외사항 처리내용
	public WrongPasswordException() {}
	public WrongPasswordException(String message) {
		super(message);
	}
}
public class LoginTryCatch {

	public static void main(String[] args) {
		try {
			login("white","12345");
		} catch (NotExistIDException e) {
			e.printStackTrace();
		} catch (WrongPasswordException e) {
			e.printStackTrace();
		}
		try {
			login("blue","54321");
		} catch (NotExistIDException e) {
			e.printStackTrace();
		} catch (WrongPasswordException e) {
			e.printStackTrace();
		}
	}
	
	public static void login(String id, String password) throws NotExistIDException, WrongPasswordException {
		//ID가 "blue"가 아니라면 NotExistIDException 발생
		if(!id.equals("blue")) {
			//강제 예외오류(Exception)처리 - NotExistIDException 왜? 테스트해보려고
			throw new NotExistIDException("아이디가 존재하지 않음");
			
		}
	//pw가 "12345"가 아니라면 WrongPasswordException 발생
		if(!password.equals("12345")) {
			//강제 예외오류(Exception)처리 - WrongPasswordException 왜? 테스트해보려고
			throw new WrongPasswordException("패스워드가 일치하지 않음");
		}
	}
}
