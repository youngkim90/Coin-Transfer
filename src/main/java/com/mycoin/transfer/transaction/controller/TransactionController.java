package com.mycoin.transfer.transaction.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface TransactionController {
	 public ModelAndView deal(HttpServletRequest request, HttpServletResponse response) throws Exception;
	 public ModelAndView buylist(HttpServletRequest request, HttpServletResponse response) throws Exception;
	 public ModelAndView sellist(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
