package com.mycoin.transfer.transaction.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mycoin.transfer.account.vo.CoininfoVO;
import com.mycoin.transfer.transaction.dao.TransactionDAO;
import com.mycoin.transfer.transaction.vo.TransactionVO;

@Service("transactionService")
@Transactional(propagation=Propagation.REQUIRED)
public class TransactionServiceImpl implements TransactionService {
	@Autowired 
	TransactionDAO transactionDAO;
	@Autowired 
	TransactionVO transactionVO;
	
	public Map<String,List<TransactionVO>> buylist() throws Exception {
		Map<String,List<TransactionVO>> dealMap=new HashMap<String,List<TransactionVO>>();
		List<TransactionVO> buyList=transactionDAO.selectBuyList();
		dealMap.put("buylist",buyList);

		return dealMap;
	}
	
	public Map<String,List<TransactionVO>> selllist() throws Exception {
		Map<String,List<TransactionVO>> dealMap=new HashMap<String,List<TransactionVO>>();
		List<TransactionVO> sellList=transactionDAO.selectSellList();
		dealMap.put("selllist",sellList);

		return dealMap;
	}
}
