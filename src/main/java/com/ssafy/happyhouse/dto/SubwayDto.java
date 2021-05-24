package com.ssafy.happyhouse.dto;

public class SubwayDto {
	int id;
	String name;
	String route_name;
	String eng_name;
	String transfer;
	String transfer_name;
	double lat;
	double lit;
	String address_st;
	String phone;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRoute_name() {
		return route_name;
	}
	public void setRoute_name(String route_name) {
		this.route_name = route_name;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getTransfer() {
		return transfer;
	}
	public void setTransfer(String transfer) {
		this.transfer = transfer;
	}
	public String getTransfer_name() {
		return transfer_name;
	}
	public void setTransfer_name(String transfer_name) {
		this.transfer_name = transfer_name;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLit() {
		return lit;
	}
	public void setLit(double lit) {
		this.lit = lit;
	}
	public String getAddress_st() {
		return address_st;
	}
	public void setAddress_st(String address_st) {
		this.address_st = address_st;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
