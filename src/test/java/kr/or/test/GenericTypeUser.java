package kr.or.test;

import java.util.HashMap;
import java.util.Map;

//제네릭 타입 클래스 생성 -> 매개변수를 여러개 사용할 수 있음
class Container<T> {
	private T t;
	public void set(T t) {
		this.t =t;
	}
	public T get() {
		return t;
	}
}

class ContainerKV<K,V> {
	private K key;
	private V value;
	
	public void set(K key, V value) {
		this.key = key;
		this.value = value;
	}
	
	public K getKey() {
		return key;
	}
	public V getValue() {
		return value;
	}
	}

public class GenericTypeUser {

	public static void main(String[] args) {
		ContainerKV<String,String> containerKV1 = new ContainerKV<String,String>();
		containerKV1.set("name", "데자와");
		String nameK = containerKV1.getKey();
		String nameV = containerKV1.getValue(); 
		System.out.println("입력된 ContainerKV변수의 키는 " + nameK);
		System.out.println("입력된 ContainerKV변수의 값은 " + nameV);
		
		Map<String,String> tableKV = new HashMap<String,String>(); //따로 클래스를 만들필요가 없음
		tableKV.put("userid", "user02");
		tableKV.put("userpw", "1234"); 
		tableKV.put("username", "데자와"); //age key에 값을 입력
		System.out.println("아이디는 " + tableKV.get("userid"));
		System.out.println("암호는 " + tableKV.get("userpw"));
		System.out.println("이름은 " + tableKV.get("username"));
	
		Container<String> container1 = new Container<String>();
				//컨테이너1 t변수 = 스트링 데자와
				container1.set("데자와");
				String name = container1.get();
				
				Container<Integer> container2 = new Container<Integer>();
				//컨테이너2 t변수 = 정수형 6
				container2.set(6);
				int age = container2.get();
				
				System.out.println("이름은 " + name + " 나이는 " + age +"살");

	}

}
