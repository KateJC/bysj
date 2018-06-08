package com.jkc.loginAndRegister.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.jkc.loginAndRegister.entity.UserOfficial;
import com.jkc.loginAndRegister.entity.school;

public interface UserOfficialMapper {
	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:26:14
	 * @Information: 根据ID删除
	 * @return:int
	 * @param id
	 * @return
	 */
	public int deleteByPrimaryKey(String id);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:25:57
	 * @Information: 保存全部内容
	 * @return:int
	 * @param record
	 * @return
	 */
	public int insert(UserOfficial record);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:25:31
	 * @Information: 选择性的保存内容
	 * @return:int
	 * @param record
	 * @return
	 */
	public int insertSelective(UserOfficial record);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:25:13
	 * @Information: 根据ID查询
	 * @return:List<Map<String,Object>>
	 * @param id
	 * @return
	 */
	public List<Map<String, Object>> selectByPrimaryKey(String id);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:24:38
	 * @Information: 根据ID选择性更新部分内容
	 * @return:int
	 * @param record
	 * @return
	 */
	public int updateByPrimaryKeySelective(UserOfficial record);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:24:12
	 * @Information: 根据ID更新所有内容
	 * @return:int
	 * @param record
	 * @return
	 */
	public int updateByPrimaryKey(UserOfficial record);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:23:29
	 * @Information:学校用户登录
	 * @return:Map<String,Object>
	 * @param schoolId
	 *            所属学校主键ID
	 * @param phone
	 *            登录账号，即手机号
	 * @param password
	 *            登录密码
	 * @return
	 */
	public Map<String, Object> loginSchool(@Param("schoolId") String schoolId, @Param("phone") String phone,
			@Param("password") String password);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月6日下午2:22:34
	 * @Information:社团用户登录
	 * @return:Map<String,Object>
	 * @param id
	 *            主键
	 * @param schoolId
	 *            所属学校主键
	 * @param phone
	 *            登录账号，即手机号
	 * @param password
	 *            登录密码
	 * @return
	 */
	public Map<String, Object> loginClub(@Param("id") String id, @Param("schoolId") String schoolId,
			@Param("phone") String phone, @Param("password") String password);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日下午12:20:05
	 * @Information:检查该学校时候有该官方F用户帐号
	 * @return:String
	 * @param schoolId
	 * @param phone
	 * @return
	 */
	public String selectBySchoolIdAndPhone(@Param("schoolId") String schoolId, @Param("phone") String phone);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日下午7:19:44
	 * @Information:检查该学校该社团是否有该官方用户帐号
	 * @return:String
	 * @param schoolId
	 * @param phone
	 * @param club
	 * @return
	 */
	public String selectBySchoolIdAndPhoneAndClub(@Param("schoolId") String schoolId, @Param("phone") String phone,
			@Param("club") String club);

	public List selectClubListByschoolId(@Param("schoolId") String schoolId);

}