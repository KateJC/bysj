package com.jkc.msg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.jkc.msg.entity.MsgBaseInfo;

/**
 * @Author:kjc
 * @version @Date:2018年4月6日下午9:57:30
 * @Information:
 * 
 */
public interface MsgBaseInfoMapper {
	int deleteByPrimaryKey(String id);

	int insert(MsgBaseInfo record);

	int insertSelective(MsgBaseInfo record);

	MsgBaseInfo selectByPrimaryKey(String id);

	int updateByPrimaryKeySelective(MsgBaseInfo record);

	int updateByPrimaryKeyWithBLOBs(MsgBaseInfo record);

	int updateByPrimaryKey(MsgBaseInfo record);

	public int countMyMsgNumb(@Param("userId") String userId);

}
