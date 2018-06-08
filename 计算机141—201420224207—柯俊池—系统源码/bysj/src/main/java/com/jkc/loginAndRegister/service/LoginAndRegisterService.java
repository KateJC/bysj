package com.jkc.loginAndRegister.service;

import java.util.List;
import java.util.Map;

import com.jkc.loginAndRegister.entity.UserOfficial;
import com.jkc.loginAndRegister.entity.UserStudent;
import com.jkc.loginAndRegister.entity.school;

/**
 * @Author:kjc
 * @version @Date:2018年3月25日下午4:23:20
 * @Information:
 * 
 */
public interface LoginAndRegisterService {
	public int deleteByPrimaryKey(String id);

	public int insert(UserStudent record);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:28:45
	 * @Information: 登录
	 * @return:Map<String,Object>
	 * @param paramsToMap
	 * @return
	 */
	public Map<String, Object> login(Map<String, String> paramsToMap);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:29:22
	 * @Information: 注册
	 * @return:int
	 * @param userObject
	 * @param user_type
	 * @return
	 */
	public int register(Object userObject, String user_type);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:30:07
	 * @Information: 根据ID查询用户基本信息
	 * @return:Map<String,Object>
	 * @param id
	 * @param user_type
	 * @return
	 */
	public Map<String, Object> selectByPrimaryKey(String id, String user_type);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:30:38
	 * @Information: 根据ID更新学生用户基本信息
	 * @return:int
	 * @param record
	 * @return
	 */
	public int updateUserStudentByPrimaryKeySelective(UserStudent record);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:31:10
	 * @Information: 根据iD更新学校或社团用户基本信息
	 * @return:int
	 * @param userOfficial
	 * @return
	 */
	public int updateUserOfficialByPrimaryKeySelective(UserOfficial userOfficial);

	public int updateByPrimaryKey(UserStudent record);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:31:54
	 * @Information: 加载查询所有的学校列表
	 * @return:List
	 * @return
	 */
	public List loadSchoolList();

	public List loadClubList(String schoolId);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:26:50
	 * @Information: 根据ID查询学校列表
	 * @return:school
	 * @param id
	 * @return
	 */
	public school loadSchoolListById(String id);

	public String checkAccount(String schoolId, String phone, String user_type, String club);
}
