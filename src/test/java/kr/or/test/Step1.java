package kr.or.test;

public class Step1 {

	public static void main(String[] args) {
		System.out.println("내장변수 자료형 소스");
        //필드=변수
		String name; int age; String phoneNum;//<-카멜(camel) 표기법,낙타등표기법 
        name = "가가가"; age= 38; phoneNum = "011-0922-7465";
        printMember(name, age, phoneNum); //<-메서드의 매개변수(인자, 파라미터)로 값 전달
        name = "나나나"; age= 28; phoneNum = "011-3444-0423";
        printMember(name, age, phoneNum); //<-메서드의 매개변수(인자, 파라미터)로 값 전달
        name = "다다다"; age= 18; phoneNum = "010-8888-0101";
        printMember(name, age, phoneNum); //<-메서드의 매개변수(인자, 파라미터)로 값 전달

	    System.out.println("내장변수 배열자료형 소스");
	    String[] names = {"가가가","나나나","다다다"};
	    int[] ages = {38,28,18};
	    String[] phoneNums = {"011-0922-7465","011-3444-0423","010-8888-0101"};
	    printMember(names,ages,phoneNums);
	}
	
    //오버로드 -> 같은 이름의 매개변수가 틀린 메서드
	private static void printMember(String[] names, int[] ages, String[] phoneNums) {
	    int cntLength = names.length;
	    System.out.println("매개변수 이름의 갯수는 " + cntLength + "입니다");
		//배열은 값을 참조할 때 주소(index)를 사용하는데, 0번 주소부터 사용함! 
		for(int cnt=0; cnt<cntLength; cnt++) {
	    	System.out.println(names[cnt]);
	    	System.out.println(ages[cnt]);
	    	System.out.println(phoneNums[cnt]);
	    	System.out.println("이름: "+names[cnt]+ " | 나이: " + ages[cnt] + " | 전화번호:" + phoneNums[cnt]);
	    }
		
	}

	private static void printMember(String name, int age, String phoneNum) {
		System.out.println("이름: "+name+ " | 나이: " + age + " | 전화번호:" + phoneNum);
		
	}

}
