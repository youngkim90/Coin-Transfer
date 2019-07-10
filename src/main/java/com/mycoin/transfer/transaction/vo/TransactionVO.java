package com.mycoin.transfer.transaction.vo;

import org.springframework.stereotype.Component;

@Component("transactionVO")
public class TransactionVO {

	private String accountNO;
	private String coinTitle;
	private int buyAmount;
	private int needMoney;
	private String buyDate;
	private int buyPrice;
	private int sellAmount;
	private int getMoney;
	private String sellDate;
	private int sellPrice;
	
	public String getAccountNO() {
		return accountNO;
	}
	public void setAccountNO(String accountNO) {
		this.accountNO = accountNO;
	}
	public String getCoinTitle() {
		return coinTitle;
	}
	public void setCoinTitle(String coinTitle) {
		this.coinTitle = coinTitle;
	}
	public int getBuyAmount() {
		return buyAmount;
	}
	public void setBuyAmount(int buyAmount) {
		this.buyAmount = buyAmount;
	}
	public int getNeedMoney() {
		return needMoney;
	}
	public void setNeedMoney(int needMoney) {
		this.needMoney = needMoney;
	}
	public String getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}
	public int getSellAmount() {
		return sellAmount;
	}
	public void setSellAmount(int sellAmount) {
		this.sellAmount = sellAmount;
	}
	public int getGetMoney() {
		return getMoney;
	}
	public void setGetMoney(int getMoney) {
		this.getMoney = getMoney;
	}
	public String getSellDate() {
		return sellDate;
	}
	public void setSellDate(String sellDate) {
		this.sellDate = sellDate;
	}
	public int getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}
	public int getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(int sellPrice) {
		this.sellPrice = sellPrice;
	}
	
		
}
