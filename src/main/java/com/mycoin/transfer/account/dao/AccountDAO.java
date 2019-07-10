package com.mycoin.transfer.account.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycoin.transfer.account.vo.AccountVO;
import com.mycoin.transfer.account.vo.CoininfoVO;

@Repository("accountDAO")
public interface AccountDAO {
	public void updateBalance1(int money) throws DataAccessException;
	public void updateBalance2(int money) throws DataAccessException;
	public List<CoininfoVO> selectCoinList() throws DataAccessException;
	public List<CoininfoVO> myCoinList(int im) throws DataAccessException;
	public void exchangeCoin(Map<String, Object> coinMap) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public void addCustInfo(Map<String, Object> custMap);
	public AccountVO selectCustInfo(Map<String, String> custInfo) throws DataAccessException;
	public int selectAccNO() throws DataAccessException;
	public void updateNewAcc(Map<String, Object> accMap) throws DataAccessException;
	public String selectOverlapped(int im) throws DataAccessException;
	public void insertBuyInfo(Map<String, Object> buyMap) throws DataAccessException;
	public void insertBuyList(Map<String, Object> buyMap) throws DataAccessException;
	public void updateBuyInfo(Map<String, Object> buyMap) throws DataAccessException;
	public String coinOverlapped(Map<String, Object> buyMap) throws DataAccessException;
	public void updateAccNO(Map<String, Object> buyMap) throws DataAccessException;
}
