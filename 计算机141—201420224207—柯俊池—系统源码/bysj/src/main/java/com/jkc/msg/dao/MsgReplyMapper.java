package com.jkc.msg.dao;

import com.jkc.msg.entity.MsgReply;

/**
 * @Author:kjc
 * @version @Date:2018年4月6日下午9:59:22
 * @Information:
 * 
 */
public interface MsgReplyMapper {
	int insert(MsgReply record);

	int insertSelective(MsgReply record);

	int deleteByPrimaryKey(String id);
}
