package com.mycoin.transfer.account.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.mycoin.transfer.account.dao.AccountDAOImpl;
import com.mycoin.transfer.account.vo.AccountVO;
import com.mycoin.transfer.account.vo.CoininfoVO;

public interface AccountService {
	public void sendMoney(String money) throws Exception;
	public Map<String,List<CoininfoVO>> listCoin() throws Exception;
	public Map<String,List<CoininfoVO>> myCoin(int im) throws Exception;
	public void exCoin(Map<String, Object> coinMap) throws Exception;
	public String overlapped(String id) throws Exception;
	public void addcust(Map<String, Object> custMap) throws Exception;
	public AccountVO logincfm(Map<String, String> loginMap) throws Exception;
	public int accmake() throws Exception;
	public void newAcc(Map<String, Object> loginMap) throws Exception;
	public void addbuyinfo(Map<String, Object> buyMap) throws Exception;
}
