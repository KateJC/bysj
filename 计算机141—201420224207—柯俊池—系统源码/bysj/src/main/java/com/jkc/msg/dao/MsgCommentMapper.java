package com.jkc.msg.dao;

import com.jkc.msg.entity.MsgComment;

/**
 * @Author:kjc
 * @version @Date:2018年4月6日下午9:58:06
 * @Information:
 * 
 */

public interface MsgCommentMapper {
	int insert(MsgComment record);

	int insertSelective(MsgComment record);

	int deleteByPrimaryKey(String id);
}