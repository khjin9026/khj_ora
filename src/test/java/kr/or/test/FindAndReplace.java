package kr.or.test;

public class FindAndReplace {

	public static void main(String[] args) {
		String str = "모든 프로그램은 자바언어로 개발 될 수 있음";
		int index = str.indexOf("자바");
		if(index==-1) {
			System.out.println("자바 문자열이 포함되어있지 않음");
			}else {
				System.out.println("자바 문자열이 포함되어 있음");
				System.out.println("index값은: " + index + "입니다");
				str = str.replace("자바", "JAVA");
				System.out.println("--->"+str);
			}

	}

}
