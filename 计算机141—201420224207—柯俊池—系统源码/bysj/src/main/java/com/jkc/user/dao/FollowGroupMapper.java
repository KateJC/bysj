package com.jkc.user.dao;

import com.jkc.user.entity.FollowGroup;

public interface FollowGroupMapper {
	int insert(FollowGroup record);

	int insertSelective(FollowGroup record);
}