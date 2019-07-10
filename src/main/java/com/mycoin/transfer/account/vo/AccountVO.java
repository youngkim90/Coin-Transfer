package com.mycoin.transfer.account.vo;

import org.springframework.stereotype.Component;

@Component("accountVO")
public class AccountVO {
	private int accountNO1;
	private int accountNO2;
	private int accountNO3;
	private String accountPW;
	private String custName;
	private int balance;
	private String joinDate;
	private String cust_id;
	private String cust_pw;
	private String cust_pw2;
	private int cust_gender;
	private int cust_birth_y;
	private int cust_birth_m;
	private int cust_birth_d;
	private int cust_birth_gn;
	private int hp1;
	private int hp2;
	private int hp3;
	

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getCust_id() {
		return cust_id;
	}

	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}

	public String getCust_pw() {
		return cust_pw;
	}

	public void setCust_pw(String cust_pw) {
		this.cust_pw = cust_pw;
	}

	public String getCust_pw2() {
		return cust_pw2;
	}

	public void setCust_pw2(String cust_pw2) {
		this.cust_pw2 = cust_pw2;
	}

	public int getCust_gender() {
		return cust_gender;
	}

	public void setCust_gender(int cust_gender) {
		this.cust_gender = cust_gender;
	}

	public int getCust_birth_y() {
		return cust_birth_y;
	}

	public void setCust_birth_y(int cust_birth_y) {
		this.cust_birth_y = cust_birth_y;
	}

	public int getCust_birth_m() {
		return cust_birth_m;
	}

	public void setCust_birth_m(int cust_birth_m) {
		this.cust_birth_m = cust_birth_m;
	}

	public int getCust_birth_d() {
		return cust_birth_d;
	}

	public void setCust_birth_d(int cust_birth_d) {
		this.cust_birth_d = cust_birth_d;
	}

	public int getCust_birth_gn() {
		return cust_birth_gn;
	}

	public void setCust_birth_gn(int cust_birth_gn) {
		this.cust_birth_gn = cust_birth_gn;
	}

	public int getHp1() {
		return hp1;
	}

	public void setHp1(int hp1) {
		this.hp1 = hp1;
	}

	public int getHp2() {
		return hp2;
	}

	public void setHp2(int hp2) {
		this.hp2 = hp2;
	}

	public int getHp3() {
		return hp3;
	}

	public void setHp3(int hp3) {
		this.hp3 = hp3;
	}

	public int getAccountNO1() {
		return accountNO1;
	}

	public void setAccountNO1(int accountNO1) {
		this.accountNO1 = accountNO1;
	}
	
	public int getAccountNO2() {
		return accountNO2;
	}

	public void setAccountNO2(int accountNO2) {
		this.accountNO2 = accountNO2;
	}

	public int getAccountNO3() {
		return accountNO3;
	}

	public void setAccountNO3(int accountNO3) {
		this.accountNO3 = accountNO3;
	}
	
	public String getAccountPW() {
		return accountPW;
	}

	public void setAccountPW(String accountPW) {
		this.accountPW = accountPW;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	
	
	
	
	

}
