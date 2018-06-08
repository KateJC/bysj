package com.jkc.loginAndRegister.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.jkc.loginAndRegister.dao.UserOfficialMapper;
import com.jkc.loginAndRegister.dao.UserStudentMapper;
import com.jkc.loginAndRegister.dao.schoolMapper;
import com.jkc.loginAndRegister.entity.UserOfficial;
import com.jkc.loginAndRegister.entity.UserStudent;
import com.jkc.loginAndRegister.entity.school;
import com.jkc.loginAndRegister.service.LoginAndRegisterService;

/**
 * @Author:kjc
 * @version @Date:2018年3月26日下午7:23:26
 * @Information:
 * 
 */
@Service("loginAndRegisterServiceImpl")
public class LoginAndRegisterServiceImpl implements LoginAndRegisterService {
	@Autowired
	UserStudentMapper userStudentMapper;
	@Autowired
	schoolMapper schoolMapper;
	@Autowired
	UserOfficialMapper userOfficialMapper;

	@Override
	public int deleteByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(UserStudent record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int register(Object userObject, String user_type) {
		int result = 0;
		if ("school".equals(user_type) || "club".equals(user_type)) {
			UserOfficial userOfficial = (UserOfficial) userObject;
			userOfficial.setCreatTime(new Date());
			userOfficial.setUserType(user_type);
			userOfficial.setAdminType("super");
			userOfficial.setStatus("false");
			result = userOfficialMapper.insertSelective(userOfficial);
		}
		if ("student".equals(user_type)) {
			UserStudent userStudent = (UserStudent) userObject;
			userStudent.setStatus("false");
			userStudent.setCreatTime(new Date());
			result = userStudentMapper.insertSelective(userStudent);
		}
		return result;
	}

	@Override
	public Map<String, Object> login(Map<String, String> paramsToMap) {
		String userType = paramsToMap.get("userType");
		String clubId = paramsToMap.get("clubId");
		String schoolId = paramsToMap.get("schoolId");
		String password = paramsToMap.get("password");
		String phone = paramsToMap.get("phone");
		Map<String, Object> resultsMap = null;
		if ("student".equals(userType)) {
			resultsMap = userStudentMapper.login(schoolId, phone, password);

		} else if ("school".equals(userType)) {
			resultsMap = userOfficialMapper.loginSchool(schoolId, phone, password);

		} else if ("club".equals(userType)) {
			resultsMap = userOfficialMapper.loginClub(clubId, schoolId, phone, password);
		}

		if (resultsMap != null && resultsMap.size() > 0) {
			return resultsMap;
		} else {
			return null;
		}

	}

	@Override
	public Map<String, Object> selectByPrimaryKey(String id, String user_type) {
		if ("school".equals(user_type) || "club".equals(user_type)) {
			List<Map<String, Object>> resultslist = userOfficialMapper.selectByPrimaryKey(id);
			if (resultslist != null && resultslist.size() > 0) {
				Map<String, Object> map = resultslist.get(0);
				return map;
			} else {
				return null;
			}

		} else {
			List<Map<String, Object>> resultslist = userStudentMapper.selectByPrimaryKey(id);
			if (resultslist != null && resultslist.size() > 0) {
				Map<String, Object> map = resultslist.get(0);
				return map;
			} else {
				return null;
			}

		}
	}

	@Override
	public int updateUserStudentByPrimaryKeySelective(UserStudent userStudent) {
		return userStudentMapper.updateByPrimaryKeySelective(userStudent);
	}

	@Override
	public int updateUserOfficialByPrimaryKeySelective(UserOfficial userOfficial) {

		return userOfficialMapper.updateByPrimaryKeySelective(userOfficial);
	}

	@Override
	public int updateByPrimaryKey(UserStudent record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List loadSchoolList() {
		List<school> list = schoolMapper.selectSchoolList();
		return list;

	}

	@Override
	public school loadSchoolListById(String id) {
		school school = schoolMapper.selectByPrimaryKey(id);
		return school;

	}

	@Override
	public String checkAccount(String schoolId, String phone, String user_type, String club) {
		String id = "";
		if ("school".equals(user_type)) {

			id = userOfficialMapper.selectBySchoolIdAndPhone(schoolId, phone);
		} else if ("student".equals(user_type)) {
			id = userStudentMapper.selectBySchoolIdAndPhone(schoolId, phone);
		} else if ("club".equals(user_type)) {
			id = userOfficialMapper.selectBySchoolIdAndPhoneAndClub(schoolId, phone, club);
		}
		return id;
	}

	@Override
	public List loadClubList(String schoolId) {

		List resultsList = userOfficialMapper.selectClubListByschoolId(schoolId);
		return resultsList;
	}

}
