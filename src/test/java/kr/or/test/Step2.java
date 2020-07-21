package kr.or.test;

//VO(value object)클래스형 자료형
class MemberVO {
	private String name;
    private int age;
    private String phoneNum;    
    
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", age=" + age + ", phoneNum=" + phoneNum + "]";
	}
	
}

class MemberService {
	//액션-서비스 클래스 - 출력용 메서드 작성
    //매개변수로 클래스 배열을 받아서 출력하는 형태로 작성
	public void printMembers(MemberVO[] members) {
		//향산된 for(loop)문 사용 ( 형태 -> 단일값:전체값 )
		for(MemberVO m:members) {
			System.out.println("이름: "+ m.getName() + " | 나이: " + m.getAge() + " | 전화번호:" + m.getPhoneNum());
		}
	}
}

public class Step2 {

	public static void main(String[] args) {
		System.out.println("클래스형 변수 - 사용자정의 자료형");
		//MemberVO 클래스를 실행하기위해 new연산자 사용
		MemberVO m1 = new MemberVO();
		// setter 메서드를 이용해 해당 인스턴스 변수에 값을 입력
		m1.setName("가가가");
		m1.setAge(38);
		m1.setPhoneNum("011-0922-7465");
		//마찬가지로 다른 MemberVO 객체(instance)를 생성해서 값을 입력
        MemberVO m2 = new MemberVO();
        MemberVO m3 = new MemberVO();
        m2.setName("나나나");
        m2.setAge(28);
        m2.setPhoneNum("011-3444-0423");
        m3.setName("다다다");
        m3.setAge(18);
        m3.setPhoneNum("010-8888-0101");
        
        //크기가 3인 MemberVO클래스를 배열객체로 선언
        MemberVO[] members = new MemberVO[3];
        //MemberVO[]배열클래스 index에 m1,m2,m3를 넣음 	
        members[0] = m1;
        members[1] = m2;
        members[2] = m3;
        //출력 : MemberService 클래스를 사용
        MemberService ms = new MemberService();
        ms.printMembers(members);
 	}

}
