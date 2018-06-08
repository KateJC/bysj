package com.jkc.personalHomepage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jkc.loginAndRegister.dao.UserStudentMapper;
import com.jkc.loginAndRegister.entity.UserStudent;
import com.jkc.personalHomepage.service.PersonalHomepageService;

import utils.StringUtil;

/**
 * @Author:kjc
 * @version @Date:2018年3月31日下午8:24:01
 * @Information:
 * 
 */
@Service("personalHomepageServiceImpl")
public class PersonalHomepageServiceImpl implements PersonalHomepageService {
	@Autowired
	UserStudentMapper userStudentMapper;

	@Override
	public UserStudent loadPersonInfo(String id) {
		List<Map<String, Object>> list = userStudentMapper.selectByPrimaryKey(id);
		return null;
	}

}
