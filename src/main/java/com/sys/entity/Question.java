package com.sys.entity;

public class Question {
	private int id;
	private String q1;
	private String q2;
	
	public Question() {
		
	}
	public Question(int id, String q1, String q2) {
		this.id = id;
		this.q1 = q1;
		this.q2 = q2;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getQ1() {
		return q1;
	}
	public void setQ1(String q1) {
		this.q1 = q1;
	}
	public String getQ2() {
		return q2;
	}
	public void setQ2(String q2) {
		this.q2 = q2;
	}
}
