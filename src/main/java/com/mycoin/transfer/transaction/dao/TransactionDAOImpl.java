package com.mycoin.transfer.transaction.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycoin.transfer.account.vo.CoininfoVO;
import com.mycoin.transfer.transaction.vo.TransactionVO;

@Repository("transactionDAO")
public class TransactionDAOImpl implements TransactionDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<TransactionVO> selectBuyList() throws DataAccessException {
		List<TransactionVO> buyList=(ArrayList)sqlSession.selectList("mapper.transaction.selectBuyList");
		return buyList;
	}
	
	public List<TransactionVO> selectSellList() throws DataAccessException {
		List<TransactionVO> sellList=(ArrayList)sqlSession.selectList("mapper.transaction.selectSellList");
		return sellList;
	}
}
