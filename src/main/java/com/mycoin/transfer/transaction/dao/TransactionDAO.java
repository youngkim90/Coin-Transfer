package com.mycoin.transfer.transaction.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mycoin.transfer.transaction.vo.TransactionVO;

public interface TransactionDAO {
	public List<TransactionVO> selectBuyList() throws DataAccessException;
	public List<TransactionVO> selectSellList() throws DataAccessException;
}
