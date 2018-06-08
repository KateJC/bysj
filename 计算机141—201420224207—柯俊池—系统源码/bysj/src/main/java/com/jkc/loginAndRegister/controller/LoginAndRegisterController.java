package com.jkc.loginAndRegister.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.nimbus.NimbusLookAndFeel;

import org.apache.commons.collections.bag.TreeBag;
import org.apache.commons.pool2.UsageTracking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jkc.loginAndRegister.entity.UserOfficial;
import com.jkc.loginAndRegister.entity.UserStudent;
import com.jkc.loginAndRegister.service.LoginAndRegisterService;

import utils.CookieUtils;
import utils.JkReturnJson;
import utils.StringUtil;
import utils.Utils;

/**
 * @Author:kjc
 * @version @Date:2018年3月23日下午10:12:21
 * @Information:
 * 
 */
@Controller
@RequestMapping("/loginAndRegisterController")
public class LoginAndRegisterController {
	@Autowired
	LoginAndRegisterService loginAndRegisterServiceImpl;

	/* @ModelAttribute("user") */
	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月4日下午9:29:51
	 * @Information:登录或注册接口
	 * @return:JkReturnJson
	 * @param userStudent
	 * @param userOfficial
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/register")
	@ResponseBody
	public JkReturnJson register(UserStudent userStudent, UserOfficial userOfficial, HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		JkReturnJson jkReturnJson = new JkReturnJson();
		String schoolId = paramsToMap.get("schoolId");
		String password = paramsToMap.get("password");
		String phone = paramsToMap.get("phone");
		String user_type = paramsToMap.get("user_type");
		String msg = "注册成功";
		String club = paramsToMap.get("clubName");
		HashMap<String, Object> data = new HashMap<>();
		HashMap<String, String> msgMap = new HashMap<>();
		HttpSession session = request.getSession();
		boolean flag = true;
		if ("club".equals(user_type) && StringUtil.isEmpty(club)) {
			flag = false;
			msgMap.put("club", "社团名称还未填写");
		}
		if (StringUtil.isEmpty(schoolId)) {
			flag = false;
			msgMap.put("school", "学校还没选择");
		}
		if (StringUtil.getStringLen(password) < 8) {
			flag = false;
			msgMap.put("password", "密码长度至少为8位");
		}
		if (!Utils.checkCellphone(phone)) {
			flag = false;
			msgMap.put("phone", "请输入正确的手机号码");
		}
		if (flag) {
			int result = 0;
			Object object = new Object();
			if ("school".equals(user_type) || "club".equals(user_type)) {
				object = userOfficial;
			} else {
				object = userStudent;
			}
			String checkresults = loginAndRegisterServiceImpl.checkAccount(schoolId, phone, user_type, club);
			if (StringUtil.isEmpty(checkresults)) {
				result = loginAndRegisterServiceImpl.register(object, user_type);
				if (result <= 0) {
					jkReturnJson.setFlag(false);
					jkReturnJson.setStatusCode("0000");
					jkReturnJson.setStatusMsg("注册失败");
					return jkReturnJson;
				} else {
					if ("school".equals(user_type) || "club".equals(user_type)) {
						data.put("id", userOfficial.getId());
						data.put("phone", userOfficial.getPhone());
						data.put("status", false);
						data.put("userType", user_type);
						session.setAttribute("id", userOfficial.getId());
						session.setAttribute("user", userOfficial);
						session.setAttribute("userType", user_type);
					} else {
						session.setAttribute("id", userStudent.getId());
						session.setAttribute("user", userStudent);
						session.setAttribute("userType", user_type);
						data.put("id", userStudent.getId());
						data.put("phone", userStudent.getPhone());
						data.put("status", false);
						data.put("userType", user_type);

					}
					session.setMaxInactiveInterval(60 * 60 * 24);
					jkReturnJson.setFlag(true);
					jkReturnJson.setData(data);
					jkReturnJson.setStatusCode("1000");
				}
			} else {
				jkReturnJson.setStatusCode("0000");
				jkReturnJson.setStatusMsg("该用户已经存在");
			}
		} else {
			jkReturnJson.setStatusMsg("注册失败");
			jkReturnJson.setData(data);
			jkReturnJson.setStatusCode("0000");
		}
		return jkReturnJson;
	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日上午12:06:27
	 * @Information:登录接口
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public JkReturnJson login(HttpServletRequest request, HttpServletResponse response) {
		JkReturnJson jkReturnJson = new JkReturnJson();
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		HashMap<String, Object> msgMap = new HashMap<>();
		String userType = paramsToMap.get("userType");
		String id = paramsToMap.get("clubId");
		String schoolId = paramsToMap.get("schoolId");
		String password = paramsToMap.get("password");
		String phone = paramsToMap.get("phone");
		boolean flag = true;
		HttpSession session = request.getSession();
		if ("club".equals(userType) && StringUtil.isEmpty(id)) {
			flag = false;
			msgMap.put("club", "社团还未选择");
		}
		if (StringUtil.isEmpty(schoolId)) {
			flag = false;
			msgMap.put("school", "学校还没选择");
		}
		if (StringUtil.getStringLen(password) < 8) {
			flag = false;
			msgMap.put("password", "密码长度至少为8位");
		}
		if (!Utils.checkCellphone(phone)) {
			flag = false;
			msgMap.put("phone", "请输入正确的手机号码");
		}

		if (flag) {
			Map<String, Object> usermap = loginAndRegisterServiceImpl.login(paramsToMap);
			if (usermap != null && usermap.size() > 0) {
				usermap.put("userType", userType);
				session.setAttribute("id", usermap.get("id"));
				session.setAttribute("user", usermap);
				session.setAttribute("userType", userType);
				session.setMaxInactiveInterval(60 * 60 * 24);
				jkReturnJson.setData(usermap);
				jkReturnJson.setStatusCode("1000");
				jkReturnJson.setStatusMsg("登录成功");

			} else {
				jkReturnJson.setStatusCode("0000");
				jkReturnJson.setStatusMsg("登录失败");
			}
		}
		return jkReturnJson;
	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月4日下午9:29:21
	 * @Information:加载学校列表
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadSchollList")
	@ResponseBody
	public JkReturnJson loadSchollList(HttpServletRequest request, HttpServletResponse response) {
		JkReturnJson jk = new JkReturnJson();
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		List schoolList = null;
		try {
			schoolList = loginAndRegisterServiceImpl.loadSchoolList();
			jk.setData(schoolList);
			jk.setStatusCode("1000");
			jk.setStatusMsg("操作成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jk.setData(schoolList);
			jk.setStatusCode("0000");
			jk.setStatusMsg("操作失败");
		} finally {
			return jk;
		}

	}

	@RequestMapping("/loadClubList")
	@ResponseBody
	public JkReturnJson loadClubList(HttpServletRequest request, HttpServletResponse response) {
		JkReturnJson jk = new JkReturnJson();
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		String schoolId = paramsToMap.get("schoolId");
		List clubList = null;
		try {
			clubList = loginAndRegisterServiceImpl.loadClubList(schoolId);
			jk.setData(clubList);
			jk.setStatusCode("1000");
			jk.setStatusMsg("操作成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jk.setStatusCode("0000");
			jk.setStatusMsg("操作失败");
		} finally {
			return jk;
		}

	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月5日下午9:40:30
	 * @Information:更新用户信息
	 * @return:JkReturnJson
	 * @param userStudent
	 * @param userOfficial
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/updateUserInfo")
	@ResponseBody
	public JkReturnJson updateUserInfo(UserStudent userStudent, UserOfficial userOfficial, HttpServletRequest request,
			HttpServletResponse response) {
		JkReturnJson jk = new JkReturnJson();
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		String userType = paramsToMap.get("userType");
		HttpSession session = request.getSession();
		int results = 0;
		String id = (String) session.getAttribute("id");
		try {
			if ("student".equals(userType)) {
				userStudent.setStatus("true");
				userStudent.setUpdateTime(new Date());
				results = loginAndRegisterServiceImpl.updateUserStudentByPrimaryKeySelective(userStudent);
			} else {
				userOfficial.setUpdataTime(new Date());
				userOfficial.setStatus("true");
				results = loginAndRegisterServiceImpl.updateUserOfficialByPrimaryKeySelective(userOfficial);

			}
			if (results > 0) {
				Map<String, Object> resultsMap = loginAndRegisterServiceImpl.selectByPrimaryKey(id, userType);
				if (resultsMap != null) {
					resultsMap.put("userType", userType);
					session.setAttribute("id", id);
					session.setAttribute("user", resultsMap);
					session.setAttribute("userType", userType);
				}
				session.setMaxInactiveInterval(60 * 60 * 24);
				jk.setData(resultsMap);
				jk.setStatusCode("1000");
				jk.setStatusMsg("操作成功");
			} else {
				jk.setStatusCode("0000");
				jk.setStatusMsg("操作失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jk.setStatusCode("0000");
			jk.setStatusMsg("操作失败");
		} finally {
			return jk;
		}
	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月4日下午9:30:20
	 * @Information:初始化加载用户信息
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/init")
	@ResponseBody
	public JkReturnJson init(HttpServletRequest request, HttpServletResponse response) {
		JkReturnJson jkReturnJson = new JkReturnJson();
		HttpSession session = request.getSession();
		Object object = session.getAttribute("user");
		String id = (String) session.getAttribute("id");
		if (object != null) {
			String userType = (String) session.getAttribute("userType");
			Map<String, Object> resultsMap = loginAndRegisterServiceImpl.selectByPrimaryKey(id, userType);
			if (resultsMap != null) {
				resultsMap.put("userType", userType);
				object = resultsMap;
				session.setAttribute("id", id);
				session.setAttribute("user", resultsMap);
				session.setAttribute("userType", userType);
				session.setMaxInactiveInterval(60 * 60 * 24);
			}
		}

		jkReturnJson.setData(object);
		jkReturnJson.setStatusCode("1000");
		return jkReturnJson;
	}

	@RequestMapping("/testss")
	public String testss(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		System.out.println(paramsToMap);
		System.out.println("hhhh");
		// ModelAndView modelAndView = new
		// ModelAndView("redirect:/base/index.html");
		/*
		 * ModelAndView modelAndView = new ModelAndView("base/index");
		 * modelAndView.addObject("haha", "666"); return modelAndView;
		 */
		return null;
	}

}
