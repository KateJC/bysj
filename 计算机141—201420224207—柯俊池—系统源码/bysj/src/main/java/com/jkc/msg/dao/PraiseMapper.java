package com.jkc.msg.dao;

import com.jkc.msg.entity.Praise;

public interface PraiseMapper {
	int deleteByPrimaryKey(String id);

	int insert(Praise record);

	int insertSelective(Praise record);

	Praise selectByPrimaryKey(String id);

	int updateByPrimaryKeySelective(Praise record);

	int updateByPrimaryKey(Praise record);
}