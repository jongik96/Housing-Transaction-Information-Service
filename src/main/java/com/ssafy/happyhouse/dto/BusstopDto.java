package com.ssafy.happyhouse.dto;

public class BusstopDto {
	int busstop_id;
	String busstop_name;
	double lat;
	double lit;
	public int getBusstop_id() {
		return busstop_id;
	}
	public void setBusstop_id(int busstop_id) {
		this.busstop_id = busstop_id;
	}
	public String getBusstop_name() {
		return busstop_name;
	}
	public void setBusstop_name(String busstop_name) {
		this.busstop_name = busstop_name;
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
}
