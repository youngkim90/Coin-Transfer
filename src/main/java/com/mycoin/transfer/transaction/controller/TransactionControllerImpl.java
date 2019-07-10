package com.mycoin.transfer.transaction.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycoin.transfer.account.vo.CoininfoVO;
import com.mycoin.transfer.transaction.service.TransactionService;
import com.mycoin.transfer.transaction.vo.TransactionVO;

@Controller("transactionController")
@RequestMapping(value = "/transaction")
public class TransactionControllerImpl implements TransactionController {
	@Autowired 
	TransactionService transactionService;
	@Autowired
	TransactionVO transactionVO;
	
	@RequestMapping(value = "/dealList.do", method = {RequestMethod.POST,RequestMethod.GET})
	   public ModelAndView deal(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav=new ModelAndView(viewName);
			return mav;
	   }
	
	@RequestMapping(value = "/buyList.do", method = {RequestMethod.POST,RequestMethod.GET})
	   public ModelAndView buylist(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			HttpSession session=request.getSession();
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav=new ModelAndView(viewName);
			
		
			Map<String,List<TransactionVO>> dealMap=transactionService.buylist();
			mav.addObject("buyMap",dealMap);
			return mav;
	   }
	
	@RequestMapping(value = "/sellList.do", method = {RequestMethod.POST,RequestMethod.GET})
	   public ModelAndView sellist(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			HttpSession session=request.getSession();
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav=new ModelAndView(viewName);
			
		
			Map<String,List<TransactionVO>> dealMap=transactionService.selllist();
			mav.addObject("sellMap",dealMap);
			return mav;
	   }
	
	
}
