package com.jkc.msg.dao;

import org.apache.ibatis.annotations.Param;

import com.jkc.msg.entity.Collect;

public interface CollectMapper {
	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月12日下午12:43:10
	 * @Information:添加收藏
	 * @return:int
	 * @param record
	 * @return
	 */
	public int insert(Collect record);

	public int insertSelective(Collect record);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月12日下午12:43:00
	 * @Information:取消收藏
	 * @return:int
	 * @param collectUserId
	 * @param msgId
	 * @return
	 */
	public int delectCollect(@Param("collectUserId") String collectUserId, @Param("msgId") String msgId);
}