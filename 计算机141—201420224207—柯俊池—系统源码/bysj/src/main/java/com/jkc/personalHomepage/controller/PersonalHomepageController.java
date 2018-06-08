package com.jkc.personalHomepage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jkc.loginAndRegister.dao.schoolMapper;
import com.jkc.loginAndRegister.entity.UserStudent;
import com.jkc.loginAndRegister.entity.school;
import com.jkc.loginAndRegister.service.LoginAndRegisterService;
import com.jkc.personalHomepage.service.PersonalHomepageService;

import utils.JkReturnJson;
import utils.StringUtil;
import utils.Utils;

/**
 * @Author:kjc
 * @version @Date:2018年3月31日下午8:23:07
 * @Information:
 * 
 */
@Controller
@RequestMapping("/personalHomepageController")
public class PersonalHomepageController {
	@Autowired
	PersonalHomepageService personalHomepageServiceImpl;

	@Autowired
	LoginAndRegisterService loginAndRegisterServiceImpl;

	@RequestMapping("/loadPersonInfo")
	@ResponseBody
	public JkReturnJson loadPersonInfo(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		JkReturnJson jkReturnJson = new JkReturnJson();
		String id = paramsToMap.get("userId");
		HashMap<String, Object> resultsMap = new HashMap<>();
		school school = new school();
		try {
			if (!StringUtil.isEmpty(id)) {
				UserStudent userStudent = personalHomepageServiceImpl.loadPersonInfo(id);
				if (!StringUtil.isEmpty(userStudent.getSchoolId())) {
					school = loginAndRegisterServiceImpl.loadSchoolListById(userStudent.getSchoolId());
				}
				resultsMap.put("userStudent", userStudent);
				resultsMap.put("school", school);
				jkReturnJson.setData(resultsMap);
				jkReturnJson.setStatusCode("1000");
				jkReturnJson.setStatusMsg("操作成功");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jkReturnJson.setStatusCode("0000");
			jkReturnJson.setStatusMsg("操作失败");
		} finally {
			return jkReturnJson;
		}

	}

}
