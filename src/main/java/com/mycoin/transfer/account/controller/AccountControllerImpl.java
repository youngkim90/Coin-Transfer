package com.mycoin.transfer.account.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycoin.transfer.account.service.AccountService;
import com.mycoin.transfer.account.vo.AccountVO;
import com.mycoin.transfer.account.vo.CoininfoVO;

import net.sf.json.JSONObject;

@Controller("accountController")
@RequestMapping(value = "/account")
public class AccountControllerImpl implements AccountController {
	@Autowired
	AccountService accountService;
	@Autowired
	CoininfoVO coininfoVO;
	@Autowired
	AccountVO accountVO;

	@RequestMapping(value = "/coinTransfer.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		boolean isLogon=false;
		HttpSession session = request.getSession();
		if((Boolean) session.getAttribute("isLogOn")!=null) {
		isLogon=(Boolean) session.getAttribute("isLogOn");
		}
		if(isLogon==true) {
			accountVO=(AccountVO) session.getAttribute("custInfo");
			String cust_id=accountVO.getCust_id();
			String cust_pw=accountVO.getCust_pw();
			Map<String, String> loginMap=new HashMap();
			loginMap.put("cust_id",cust_id);
			loginMap.put("cust_pw",cust_pw);
			AccountVO loginfo=accountService.logincfm(loginMap);
			session.removeAttribute("custInfo");
			session.setAttribute("custInfo",loginfo);
		}

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@RequestMapping(value = "/login.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@RequestMapping(value = "/join.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView join(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@RequestMapping(value = "/newAccount.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView newacc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@RequestMapping(value = "/buyCoin.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView buycoin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session;
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		session = request.getSession();
		session.setAttribute("side_menu", "user");
		Map<String, List<CoininfoVO>> coinMap = accountService.listCoin();
		mav.addObject("coinMap", coinMap);
		return mav;
	}

	@RequestMapping(value = "/buyCoin2.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView buycoin2(@ModelAttribute("coininfoVO") CoininfoVO _coininfoVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session.setAttribute("buyInfo",_coininfoVO);

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("buycoin", _coininfoVO);

		return mav;
	}

	@RequestMapping(value = "/coinTransfer2.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public ResponseEntity buycoin3(@RequestParam("buyamount") int buyamount,@RequestParam("cust_pw2") String cust_pw2,HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		HttpSession session = request.getSession();
		accountVO=(AccountVO)session.getAttribute("custInfo");
		coininfoVO=(CoininfoVO)session.getAttribute("buyInfo");
		

		
		if(accountVO.getCust_pw2().equals(cust_pw2)) {
			String custName=accountVO.getCustName();
			int accountNO3=accountVO.getAccountNO3();
			String coinTitle=coininfoVO.getCoinTitle();
			int coinPrice=coininfoVO.getCoinPrice();

			
			Map<String, Object> buyMap= new HashMap();
			buyMap.put("custName",custName);
			buyMap.put("accountNO3",accountNO3);
			buyMap.put("coinTitle",coinTitle);
			buyMap.put("buyamount",buyamount);
			buyMap.put("coinPrice",coinPrice);
			accountService.addbuyinfo(buyMap);
			
			try {
				message = "<script>";
				message += " alert('구매 완료하였습니다.');";
				message += " location.href='" + request.getContextPath() + "/account/coinTransfer.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

			} catch (Exception e) {
				message = "<script>";
				message += " alert('작업중 오류가 발생했습니다. 다시 시도해 주세요');";
				message += " location.href='" + request.getContextPath() + "/account/coinTransfer.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
		}}else {
			message = "<script>";
			message += " alert('2차 비밀번호가 잘못 되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/account/buyCoin.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;

	}

	@RequestMapping(value = { "/mycoin.do", "/coinExchange.do" }, method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView mycoin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session;
		session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		accountVO = (AccountVO) session.getAttribute("custInfo");

		if (accountVO != null) {
			int im = accountVO.getAccountNO3();
			Map<String, List<CoininfoVO>> mycoinMap = accountService.myCoin(im);
			if(mycoinMap.get("mycoininfo").get(0).getCoinQuantity()==0) {
				ModelAndView mav = new ModelAndView(viewName);
				mav.addObject("overlapped", mycoinMap.get("mycoininfo").get(0).getCoinQuantity());
				
				return mav;
			}
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("mycoinMap", mycoinMap);

			return mav;

		} else {
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
		}
	}

	@RequestMapping(value = "/coinEx.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public ResponseEntity excoin(@RequestParam("coinTitle") String coinTitle, @RequestParam("coinPrice") int coinPrice,
			@RequestParam("coinamount") int coinamount,@RequestParam("cust_pw2") String cust_pw2, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		
		Map<String, Object> coinMap = new HashMap<String, Object>();
		HttpSession session;
		session = request.getSession();
		
		accountVO=(AccountVO) session.getAttribute("custInfo");
		int accountNO3=accountVO.getAccountNO3();
		
		coinMap.put("coinTitle", coinTitle);
		coinMap.put("coinPrice", coinPrice);
		coinMap.put("coinamount", coinamount);
		coinMap.put("accountNO3",accountNO3);

		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		


		if(accountVO.getCust_pw2().equals(cust_pw2)) {
			
			accountService.exCoin(coinMap);
			
		try {
			message = "<script>";
			message += " alert('환전을 완료하였습니다.');";
			message += " location.href='" + request.getContextPath() + "/account/coinTransfer.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/account/coinTransfer.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
	}}else {
		message = "<script>";
		message += " alert('2차 비밀번호가 잘못 되었습니다.');";
		message += " location.href='" + request.getContextPath() + "/account/coinExchange.do';";
		message += " </script>";
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	}
	return resEnt;

	}

	@RequestMapping(value = "/overlapped.do", method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;

		String result = accountService.overlapped(id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

	@RequestMapping(value = "/addCust.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity addcust(@RequestParam Map<String, Object> custMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			accountService.addcust(custMap);
			message = "<script>";
			message += " alert('회원가입이 완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/account/login.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/account/coinTransfer.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

	@RequestMapping(value = { "/login2.do" }, method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView login2(@RequestParam Map<String, String> loginMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		accountVO = accountService.logincfm(loginMap);
		Map<String, AccountVO> infoMap = new HashMap();
		infoMap.put("custinfo", accountVO);
		
		Map<String, List<CoininfoVO>> coinMap = accountService.listCoin();
		List<CoininfoVO> coininfo=coinMap.get("coininfo");
		
		if (accountVO.getCust_id() != null && accountVO.getCust_pw() != null) {

			HttpSession session = request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("custInfo", accountVO);
			session.setAttribute("coinInfo", coininfo);

			mav.setViewName("redirect:/account/coinTransfer.do");

		} else {
			String message = "아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
			mav.addObject("message", message);
			mav.setViewName("/account/login");
		}
		return mav;

	}

	@RequestMapping(value = { "/accMake.do" }, method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody String accmake(@RequestParam("accountNO3") int accountNO3, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int accno1 = 12;
		int accno2 = 345;
		int NO;
		List accno = new ArrayList();
		JSONObject jsonObject = new JSONObject();

		String AccountNO3 = Integer.toString(accountNO3);

		if (AccountNO3 == null || accountNO3 == 0) {
			NO = accountService.accmake();
			int maxNO = NO + 1;
			accno.add(accno1);
			accno.add(accno2);
			accno.add(maxNO);
			jsonObject.put("accno", accno);

			String jsonInfo = jsonObject.toString();
			return jsonInfo;
		} else {

			return null;
		}

	}

	@RequestMapping(value = "/newAccount2.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity newaccount2(@RequestParam Map<String, Object> accMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message;
		AccountVO custinfo = (AccountVO) session.getAttribute("custInfo");
		Map<String, String> loginMap = new HashMap();
		String cust_id = (String) accMap.get("cust_id");
		String cust_pw = (String) accMap.get("cust_pw");

		String cust_pw2=custinfo.getCust_pw2();
		String custpw2=(String)accMap.get("cust_pw2");

		
		if (cust_pw2.equals(custpw2)) {
			
			loginMap.put("cust_id", cust_id);
			loginMap.put("cust_pw", cust_pw);

			accountService.newAcc(accMap);
			accountVO = accountService.logincfm(loginMap);
			
			session.removeAttribute("custInfo");
			session.setAttribute("custInfo",accountVO);
			
			try {
				message = "<script>";
				message += " alert('가상계좌 생성이 완료되었습니다.');";
				message += " location.href='" + request.getContextPath() + "/account/coinTransfer.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

			} catch (Exception e) {
				message = "<script>";
				message += " alert('작업중 오류가 발생했습니다. 다시 시도해 주세요');";
				message += " location.href='" + request.getContextPath() + "/account/newAccount.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
		}else {
			message = "<script>";
			message += " alert('아이디 및 비밀번호를 확인해주세요.');";
			message += " location.href='" + request.getContextPath() + "/account/newAccount.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			}
			
		return resEnt;

	}
	
	@RequestMapping(value="/logOut.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("custInfo");
		mav.setViewName("redirect:/account/coinTransfer.do");
		return mav;
	}
	
	@RequestMapping(value = "/coinPrice.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView coinprice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		Map<String, List<CoininfoVO>> coinMap = accountService.listCoin();
		mav.addObject("coinMap", coinMap);
		return mav;
	}

}
