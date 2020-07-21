package kr.or.member;

public class MemberVO {
	// private으로 되어있는 매개변수 회원정보 이름, 나이, 핸드폰 번호를 다른 클래스에서도 사용할 수 있도록 get-set메서드 활용
	private String name;
	private int age;
	private String phoneNum;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

}
