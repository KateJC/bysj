package com.jkc.msg.dao;

import com.jkc.msg.entity.MsgReferTo;

/**
 * @Author:kjc
 * @version @Date:2018年4月6日下午9:59:01
 * @Information:
 * 
 */
public interface MsgReferToMapper {
	int deleteByPrimaryKey(String id);

	int insert(MsgReferTo record);

	int insertSelective(MsgReferTo record);

	MsgReferTo selectByPrimaryKey(String id);

	int updateByPrimaryKeySelective(MsgReferTo record);

	int updateByPrimaryKey(MsgReferTo record);
}