package com.mycoin.transfer.account.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycoin.transfer.account.vo.AccountVO;
import com.mycoin.transfer.account.vo.CoininfoVO;

@Repository("accountDAO")
public class AccountDAOImpl implements AccountDAO {
	@Autowired
	private SqlSession sqlSession;

	public void updateBalance1(int money) throws DataAccessException {
		sqlSession.update("mapper.account.updateBalance1",money);
	}
	
	public void updateBalance2(int money) throws DataAccessException {
		sqlSession.update("mapper.account.updateBalance2",money);
	}
	
	@Override
	public List<CoininfoVO> selectCoinList() throws DataAccessException {
		List<CoininfoVO> coinList=(ArrayList)sqlSession.selectList("mapper.account.selectCoinList");
	   return coinList;	
     
	}
	
	@Override
	public List<CoininfoVO> myCoinList(int im) throws DataAccessException {


		List<CoininfoVO> mycoinList=(ArrayList)sqlSession.selectList("mapper.account.myCoinList", im);
	   return mycoinList;	
     
	}
	
	public void exchangeCoin(Map<String, Object> coinMap) throws DataAccessException {
		sqlSession.update("mapper.account.updateCoin1",coinMap);
		sqlSession.update("mapper.account.updateCoin2",coinMap);
		sqlSession.insert("mapper.account.insertCoin",coinMap);
	}
	
	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.account.selectOverlappedID",id);
		return result;
	
	}
	
	public void addCustInfo(Map<String, Object> custMap) throws DataAccessException {

		sqlSession.insert("mapper.account.insertCustInfo",custMap);
	}
	
	public AccountVO selectCustInfo(Map<String, String> custInfo) throws DataAccessException {
		
		AccountVO custinfo=(AccountVO)sqlSession.selectOne("mapper.account.selectCustInfo",custInfo);

	   return custinfo;	
     
	}
	
	public int selectAccNO() throws DataAccessException{
		int maxno=(Integer) sqlSession.selectOne("mapper.account.selectAccNo");
		System.out.println(maxno);
		return maxno;
		
	}
	
	public void updateNewAcc(Map<String, Object> accMap) throws DataAccessException {
		
		sqlSession.update("mapper.account.updateNewAcc",accMap);

     
	}
	
	@Override
	public String selectOverlapped(int im) throws DataAccessException {

		String overlap=sqlSession.selectOne("mapper.account.selectOverlapped", im);
	   return overlap;	
     
	}
	
	public void insertBuyInfo(Map<String, Object> buyMap) throws DataAccessException {

		sqlSession.insert("mapper.account.insertBuyInfo",buyMap);
	}
	
	public void insertBuyList(Map<String, Object> buyMap) throws DataAccessException {

		sqlSession.insert("mapper.account.insertBuyList",buyMap);
	}
	
	public void updateBuyInfo(Map<String, Object> buyMap) throws DataAccessException {

		sqlSession.update("mapper.account.updateBuyInfo",buyMap);
	
	}
	
	public String coinOverlapped(Map<String, Object> buyMap) throws DataAccessException {

		String overlap=(String) sqlSession.selectOne("mapper.account.coinOverlapped",buyMap);
		return overlap;
	
	}
	
	public void updateAccNO(Map<String, Object> buyMap) throws DataAccessException {

		sqlSession.update("mapper.account.updateAccNO",buyMap);
	
	}

}
