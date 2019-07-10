package com.mycoin.transfer.account.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycoin.transfer.account.vo.CoininfoVO;

public interface AccountController {

	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView join(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView newacc(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView buycoin(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView buycoin2(@ModelAttribute("coininfoVO") CoininfoVO _coininfoVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity buycoin3(@RequestParam("buyamount") int buyamout, @RequestParam("cust_pw2") String cust_pw2,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView mycoin(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity excoin(@RequestParam("coinTitle") String coinTitle, @RequestParam("coinPrice") int coinPrice,
			@RequestParam("coinamount") int coinamount,@RequestParam("cust_pw2") String cust_pw2, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ResponseEntity overlapped(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity addcust(@RequestParam Map<String, Object> custMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView login2(@RequestParam Map<String, String> loginMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public String accmake(@RequestParam("accountNO3") int accountNO3, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity newaccount2(Map<String, Object> accMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
