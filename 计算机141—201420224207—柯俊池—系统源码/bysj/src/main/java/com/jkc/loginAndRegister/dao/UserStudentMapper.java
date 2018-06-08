package com.jkc.loginAndRegister.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Primary;

import com.jkc.loginAndRegister.entity.UserStudent;

public interface UserStudentMapper {
	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:21:58
	 * @Information:根据ID删除信息
	 * @return:int
	 * @param id
	 * @return
	 */
	public int deleteByPrimaryKey(String id);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:21:40
	 * @Information:保存全部信息
	 * @return:int
	 * @param record
	 * @return
	 */
	public int insert(UserStudent record);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:21:09
	 * @Information:选择性的保存部分信息
	 * @return:int
	 * @param record
	 * @return
	 */
	public int insertSelective(UserStudent record);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:20:54
	 * @Information:根据ID查找
	 * @return:List<Map<String,Object>>
	 * @param id
	 * @return
	 */
	public List<Map<String, Object>> selectByPrimaryKey(String id);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:20:11
	 * @Information:通过ID选择性更新部分信息
	 * @return:int
	 * @param record
	 * @return
	 */
	public int updateByPrimaryKeySelective(UserStudent record);

	public int updateHead(@Param("id") String id, @Param("path") String path);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:19:12
	 * @Information:通过ID更新所有信息
	 * @return:int
	 * @param record
	 * @return
	 */
	public int updateByPrimaryKey(UserStudent record);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:18:55
	 * @Information:学生登录
	 * @return:Map<String,Object>
	 * @param schoolId
	 * @param phone
	 * @param password
	 * @return
	 */
	public Map<String, Object> login(@Param("schoolId") String schoolId, @Param("phone") String phone,
			@Param("password") String password);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日下午12:20:05
	 * @Information:检查该学校时候有该学生用户帐号
	 * @return:String
	 * @param schoolId
	 * @param phone
	 * @return
	 */
	public String selectBySchoolIdAndPhone(@Param("schoolId") String schoolId, @Param("phone") String phone);

}