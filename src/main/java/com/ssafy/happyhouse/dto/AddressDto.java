package com.ssafy.happyhouse.dto;

public class AddressDto {
//	no int AI PK 
//	city varchar(30) 
//	code varchar(30) 
//	dongcode varchar(30) 
//	gugun varchar(30) 
//	dong varchar(30) 
//	lat varchar(20) 
//	lng varchar(20)

	private int no;
	private String city;
	private String code;
	private String dongcode;
	private String gugun;
	private String dong;
	private String lat;
	private String lng;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDongcode() {
		return dongcode;
	}
	public void setDongcode(String dongcode) {
		this.dongcode = dongcode;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
}
