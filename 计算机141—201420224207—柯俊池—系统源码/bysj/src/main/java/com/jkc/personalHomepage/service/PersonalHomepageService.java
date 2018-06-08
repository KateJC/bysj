package com.jkc.personalHomepage.service;

import com.jkc.loginAndRegister.entity.UserStudent;

/**
 * @Author:kjc
 * @version @Date:2018年3月31日下午8:23:35
 * @Information:
 * 
 */
public interface PersonalHomepageService {
	public UserStudent loadPersonInfo(String id);
}
