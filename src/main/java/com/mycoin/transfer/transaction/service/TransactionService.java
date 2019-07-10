package com.mycoin.transfer.transaction.service;

import java.util.List;
import java.util.Map;

import com.mycoin.transfer.transaction.vo.TransactionVO;

public interface TransactionService {
	public Map<String,List<TransactionVO>> buylist() throws Exception;
	public Map<String,List<TransactionVO>> selllist() throws Exception;
}
