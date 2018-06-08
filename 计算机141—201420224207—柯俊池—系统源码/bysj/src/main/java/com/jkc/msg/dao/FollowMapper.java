package com.jkc.msg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.jkc.msg.entity.Follow;

public interface FollowMapper {
	public int insert(Follow record);

	public int insertSelective(Follow record);

	public int cancelFollowThisUser(@Param("initiativeUserID") String initiativeUserID,
			@Param("passivityUserId") String passivityUserId);

	public List<Map<String, Object>> selectWefollowOnEachOther(@Param("userId") String userId);

	public List<Map<String, Object>> selectMyFollow(@Param("userId") String userId);

	public List<Map<String, Object>> selectMyFans(@Param("userId") String userId);

	public List<Map<String, Object>> checkIfFollow(@Param("initiativeUserID") String initiativeUserID,
			@Param("passivityUserId") String passivityUserId);

	public int countMyFansNumb(@Param("userId") String userId);

	public int countMyFollowNumb(@Param("userId") String userId);

}