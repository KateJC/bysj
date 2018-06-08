package com.jkc.msg.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

/**
 * @Author:kjc
 * @version @Date:2018年4月9日下午3:27:03
 * @Information:
 * 
 */
public interface MsgQueryMapper {
	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日下午3:52:56
	 * @Information: 查询所有的帖子列表
	 * @return:List<Map<String,Object>>
	 * @return
	 */
	public List<Map<String, Object>> queryAllMsgListPublic(@Param("from") int from, @Param("size") int size);

	public int queryAllMsgListPublicTotal();

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月10日下午4:49:54
	 * @Information: 查询我关注的用户帖子列表
	 * @return:List<Map<String,Object>>
	 * @return
	 */
	public List<Map<String, Object>> queryMyFollowMsgListPublic(@Param("userId") String userId, @Param("from") int from,
			@Param("size") int size);

	public int queryMyFollowMsgListPublicTotal(@Param("userId") String userId);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月10日下午6:28:47
	 * @Information:查询我的学校所有用户发的帖子
	 * @return:List<Map<String,Object>>
	 * @param schoolId
	 * @return
	 */
	public List<Map<String, Object>> queryMySchoolMsgListPublic(@Param("schoolId") String schoolId,
			@Param("from") int from, @Param("size") int size);

	public int queryMySchoolMsgListPublicTotal(@Param("schoolId") String schoolId);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月11日上午12:29:20
	 * @Information:查询与该用户相互的用户的发的帖子
	 * @return:List<Map<String,Object>>
	 * @param schoolId
	 * @return
	 */
	public List<Map<String, Object>> queryMyFriendMsgListPublic(@Param("userId") String userId, @Param("from") int from,
			@Param("size") int size);

	public int queryMyFriendMsgListPublicTotal(@Param("userId") String userId);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月11日上午12:38:10
	 * @Information:查询该用户点赞过的帖子
	 * @return:List<Map<String,Object>>
	 * @param userId
	 * @return
	 */
	public List<Map<String, Object>> queryMyPraiseMsgList(@Param("userId") String userId, @Param("from") int from,
			@Param("size") int size);

	public int queryMyPraiseMsgListTotal(@Param("userId") String userId);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日下午3:52:59
	 * @Information:
	 * @return:List<Map<String,Object>>
	 * @param id:帖子的主键
	 * @return
	 */
	public List<Map<String, String>> queryPicByMsgId(String id);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日下午4:03:45
	 * @Information:获取该帖子的点赞数量
	 * @return:int
	 * @param praiseId类型对象的id
	 * @param praiseType点赞类型，这个方法是msg类型
	 * @return
	 */
	public int queryMsgPraiseAmount(@Param("praiseId") String praiseId, @Param("praiseType") String praiseType);

	public int queryMsgCommentAmount(@Param("msgId") String msgId, @Param("commentType") String commentType);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日下午10:55:23
	 * @Information: 加载帖子的评论列表
	 * @return:int
	 * @param msgId
	 * @return
	 */
	public List<Map<String, Object>> loadCommentOfMsg(@Param("msgId") String msgId);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日下午11:16:52
	 * @Information:加载评论的回复列表
	 * @return:List<Map<String,Object>>
	 * @param msgCommentId
	 * @return
	 */
	public List<Map<String, Object>> loadReplyOfComment(@Param("msgCommentId") String msgCommentId,
			@Param("replyType") String replyType);

	public List<Map<String, Object>> searchMsg(@Param("value") String value);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年5月16日下午5:21:51
	 * @Information:根据消息Id获取消息详细
	 * @return:Map<String,Object>
	 * @param id
	 * @return
	 */
	public HashMap<String, Object> getMsgByid(@Param("id") String id);

	public List<Map<String, Object>> loadMyMsgList(@Param("id") String id);

}
