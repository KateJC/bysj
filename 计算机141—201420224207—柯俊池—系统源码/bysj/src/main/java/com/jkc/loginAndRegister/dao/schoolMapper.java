package com.jkc.loginAndRegister.dao;

import java.util.List;

import com.jkc.loginAndRegister.entity.school;

public interface schoolMapper {
	public int deleteByPrimaryKey(String id);

	public int insert(school record);

	public int insertSelective(school record);

	public school selectByPrimaryKey(String id);

	public int updateByPrimaryKeySelective(school record);

	public int updateByPrimaryKey(school record);

	public List<school> selectSchoolList();
}