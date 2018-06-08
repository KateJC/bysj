package com.jkc.index.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jkc.index.service.IndexService;
import com.jkc.msg.service.MsgService;

import utils.JkReturnJson;
import utils.Utils;

/**
 * @Author:kjc
 * @version @Date:2018年1月1日下午1:46:48
 * @Information:
 * 
 */
@Controller
@RequestMapping("/indexController")
public class IndexController {
	@Autowired
	IndexService indexService;
	@Autowired
	MsgService msgServiceImgl;

	@RequestMapping("count")
	@ResponseBody
	public JkReturnJson count(HttpServletRequest request, HttpServletResponse response) {
		JkReturnJson jk = new JkReturnJson();
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		String userId = paramsToMap.get("userId");
		String userType = paramsToMap.get("userType");
		Map<String, Object> resultsMap = msgServiceImgl.count(userId, userType);
		jk.setData(resultsMap);
		jk.setStatusCode("1000");
		return jk;

	}

}
