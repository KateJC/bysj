package com.jkc.msg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jkc.msg.entity.MsgPic;

/**
 * @Author:kjc
 * @version @Date:2018年4月6日下午9:58:31
 * @Information:
 * 
 */
public interface MsgPicMapper {
	int deleteByPrimaryKey(String id);

	int insert(MsgPic record);

	int insertSelective(MsgPic record);

	MsgPic selectByPrimaryKey(String id);

	int updateByPrimaryKeySelective(MsgPic record);

	int updateByPrimaryKey(MsgPic record);

	public int insertListSelective(@Param("msgPicList") List<MsgPic> msgPicList);
}
