package com.ssafy.happyhouse.dto;

public class ParkDto {
	String management_id;
	String parkname;
	String parkdiv;
	String address_st;
	String address_jibun;
	float lat;
	float lit;
	public String getManagement_id() {
		return management_id;
	}
	public void setManagement_id(String management_id) {
		this.management_id = management_id;
	}
	public String getParkname() {
		return parkname;
	}
	public void setParkname(String parkname) {
		this.parkname = parkname;
	}
	public String getParkdiv() {
		return parkdiv;
	}
	public void setParkdiv(String parkdiv) {
		this.parkdiv = parkdiv;
	}
	public String getAddress_st() {
		return address_st;
	}
	public void setAddress_st(String address_st) {
		this.address_st = address_st;
	}
	public String getAddress_jibun() {
		return address_jibun;
	}
	public void setAddress_jibun(String address_jibun) {
		this.address_jibun = address_jibun;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getLit() {
		return lit;
	}
	public void setLit(float lit) {
		this.lit = lit;
	}
	
}
