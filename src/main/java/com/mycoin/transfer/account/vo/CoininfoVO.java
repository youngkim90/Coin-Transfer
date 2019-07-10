package com.mycoin.transfer.account.vo;
import java.sql.Date; 
import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component("coininfoVO")
public class CoininfoVO {

	private int coinNum;
	private String coinName;
	private int coinPrice;
	private String coinTitle;
	private int coinQuantity;
	
	
	public int getCoinQuantity() {
		return coinQuantity;
	}
	public void setCoinQuantity(int coinQuantity) {
		this.coinQuantity = coinQuantity;
	}
	public String getCoinTitle() {
		return coinTitle;
	}
	public void setCoinTitle(String coinTitle) {
		this.coinTitle = coinTitle;
	}
	public int getCoinNum() {
		return coinNum;
	}
	public void setCoinNum(int coinNum) {
		this.coinNum = coinNum;
	}
	public String getCoinName() {
		return coinName;
	}
	public void setCoinName(String coinName) {
		this.coinName = coinName;
	}
	public int getCoinPrice() {
		return coinPrice;
	}
	public void setCoinPrice(int coinPrice) {
		this.coinPrice = coinPrice;
	}


	
}
