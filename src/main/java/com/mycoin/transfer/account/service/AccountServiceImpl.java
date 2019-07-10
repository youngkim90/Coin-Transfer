package com.mycoin.transfer.account.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mycoin.transfer.account.dao.AccountDAO;
import com.mycoin.transfer.account.vo.AccountVO;
import com.mycoin.transfer.account.vo.CoininfoVO;

@Service("accountService")
@Transactional(propagation=Propagation.REQUIRED)
public class AccountServiceImpl implements AccountService {
	@Autowired 
	AccountDAO accountDAO;
	@Autowired 
	CoininfoVO coininfoVO;


	public void sendMoney(String money) throws Exception {
		int Money=Integer.parseInt(money);
		accountDAO.updateBalance1(Money);
		accountDAO.updateBalance2(Money);
	}
	
	public Map<String,List<CoininfoVO>> listCoin() throws Exception {
		Map<String,List<CoininfoVO>> coinMap=new HashMap<String,List<CoininfoVO>>();
		List<CoininfoVO> coinList=accountDAO.selectCoinList();
		coinMap.put("coininfo",coinList);

		return coinMap;
	}
	

	public Map<String,List<CoininfoVO>> myCoin(int im) throws Exception {
		Map<String,List<CoininfoVO>> mycoinMap=new HashMap<String,List<CoininfoVO>>();
		String overlapped=accountDAO.selectOverlapped(im);
		if(overlapped.equals("false")) {
			List<CoininfoVO> mycoinList= new ArrayList<CoininfoVO>();
			coininfoVO.setCoinQuantity(0);
			mycoinList.add(coininfoVO);
			mycoinMap.put("mycoininfo",mycoinList);
		}else if(overlapped.equals("true")) {
		List<CoininfoVO> mycoinList=accountDAO.myCoinList(im);
		mycoinMap.put("mycoininfo",mycoinList);
		}

		return mycoinMap;
	}
	


	public void exCoin(Map<String, Object> coinMap) throws Exception {
		
		accountDAO.exchangeCoin(coinMap);

	}
	
	public String overlapped(String id) throws Exception{
		return accountDAO.selectOverlappedID(id);
	}
	
	public void addcust(Map<String, Object> custMap) throws Exception {

		accountDAO.addCustInfo(custMap);
	}
	
	
	public AccountVO logincfm(Map<String, String> loginMap) throws Exception {
		
		AccountVO custinfo=(AccountVO) accountDAO.selectCustInfo(loginMap);
		return custinfo;
	}
	
	public int accmake() throws Exception {
		
		int maxno=accountDAO.selectAccNO();
		return maxno;
	}
	
public void newAcc(Map<String, Object> accMap) throws Exception {
		
		accountDAO.updateNewAcc(accMap);

	}

public void addbuyinfo(Map<String, Object> buyMap) throws Exception {
	
	
	String overlap=accountDAO.coinOverlapped(buyMap);
	System.out.println(overlap);
	if(overlap.equals("true")) {
		accountDAO.updateBuyInfo(buyMap);
		accountDAO.insertBuyList(buyMap);
		accountDAO.updateAccNO(buyMap);
	}else if(overlap.equals("false")){
	accountDAO.insertBuyInfo(buyMap);
	accountDAO.insertBuyList(buyMap);
	accountDAO.updateAccNO(buyMap);
	}
}
}


