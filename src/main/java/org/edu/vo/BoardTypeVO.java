package org.edu.vo;

public class BoardTypeVO {
	//클래스 멤버변수로 생성(아래)
	private String bod_type;
	private String bod_name;
	private Integer bod_sun;
	
	@Override
	public String toString() {
		return "BoardTypeVO [bod_type=" + bod_type + ", bod_name=" + bod_name + ", bod_sun=" + bod_sun + "]";
	}
	public String getBod_type() {
		return bod_type;
	}
	public void setBod_type(String bod_type) {
		this.bod_type = bod_type;
	}
	public String getBod_name() {
		return bod_name;
	}
	public void setBod_name(String bod_name) {
		this.bod_name = bod_name;
	}
	public Integer getBod_sun() {
		return bod_sun;
	}
	public void setBod_sun(Integer bod_sun) {
		this.bod_sun = bod_sun;
	}
	
}