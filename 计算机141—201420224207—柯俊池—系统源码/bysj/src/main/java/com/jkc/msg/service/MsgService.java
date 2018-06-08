package com.jkc.msg.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.jkc.msg.entity.Collect;
import com.jkc.msg.entity.Follow;
import com.jkc.msg.entity.MsgComment;
import com.jkc.msg.entity.MsgReply;
import com.jkc.msg.entity.Praise;

/**
 * @Author:kjc
 * @version @Date:2018年4月6日下午10:10:51
 * @Information:
 * 
 */
public interface MsgService {

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月8日上午10:40:03
	 * @Information: 保存新发布的帖子
	 * @return:Map<String,Object>
	 * @param content
	 *            消息的内容
	 * @param contenttype
	 *            消息的类型
	 * @param privilege
	 *            权限
	 * @param id
	 *            发布消息的用户ID
	 * @param usertype
	 *            用户类型
	 * @param picString
	 *            图片路径的字符串
	 * @return 返回帖子的详细详细信息
	 */
	public Map<String, Object> saveOriginalMSG(String content, String contenttype, String privilege, String id,
			String usertype, String picString, String faterId);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月8日下午8:33:21
	 * @Information: 评论这条帖子
	 * @return:Map<String,Object>
	 * @param msgComment
	 * @return 返回这条评论的详细信息以及返回评论者的用户信息
	 */
	public Map<String, Object> commentThisMsg(MsgComment msgComment);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月8日下午8:36:42
	 * @Information: 删除这条评论
	 * @return:int
	 * @param id
	 *            这条评论的id
	 * @return
	 */
	public int deleteThisComment(String id);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月8日下午10:56:03
	 * @Information: 回复评论
	 * @return:int
	 * @param msgReply
	 * @return
	 */
	public int replyThisComment(MsgReply msgReply);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月8日下午11:06:57
	 * @Information:删除这条回复
	 * @return:int
	 * @param replyId
	 * @return
	 */
	public int deleteThisReply(String replyId);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日上午1:09:11
	 * @Information: 点赞
	 * @return:int
	 * @param praise
	 * @return
	 */
	public int praise(Praise praise);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日上午10:21:08
	 * @Information: 取消点赞
	 * @return:int
	 * @param id
	 * @return
	 */
	public int praiseCancel(String id);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月10日下午4:54:47
	 * @Information:
	 * @return:List<Map<String,Object>>
	 * @param userType当前用户的类型
	 * @param id当前用户id
	 * @param queryType查询的类型
	 *            default默认查询该用户所关注的用户所发的帖子, mypraise查询该用户赞过的帖子，
	 *            mycollect查询该用户收藏过的帖子, hot查询热门帖子, mySchool查询该用户所属学校的用户发的帖子,
	 *            myfriend查询与该用户相互关注的用户发的帖子
	 * @return
	 */
	public Map<String, Object> queryIndexPageMsgList(String userType, String id, String queryType, String pageSize,
			String currentPage);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日下午10:56:11
	 * @Information:加载帖子的评论列表
	 * @return:List<Map<String,Object>>
	 * @param msgId帖子的主键
	 * @return
	 */
	public List<Map<String, Object>> loadCommentOfMsg(String msgId);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月10日上午11:03:47
	 * @Information:查找和我互相关注的用户
	 * @return:List<Map<String,Object>>
	 * @param userId
	 * @return
	 */
	public List<Map<String, Object>> selectWefollowOnEachOther(String userId, String userType);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月10日上午11:03:49
	 * @Information:查找我关注的用户
	 * @return:List<Map<String,Object>>
	 * @param userId
	 * @return
	 */
	public List<Map<String, Object>> selectMyFollow(String userId, String userType);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月10日上午11:03:52
	 * @Information:查找我的粉丝
	 * @return:List<Map<String,Object>>
	 * @param userId
	 * @return
	 */
	public List<Map<String, Object>> selectMyFans(String userId, String userType);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月10日下午4:15:00
	 * @Information: 关注
	 * @return:int
	 * @param follow
	 * @return
	 */
	public int followThisUser(Follow follow);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月10日下午4:14:56
	 * @Information: 取消关注
	 * @return:int
	 * @param initiativeUserID
	 * @param passivityUserId
	 * @return
	 */
	public int cancelFollowThisUser(String initiativeUserID, String passivityUserId);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月12日下午12:33:49
	 * @Information:取消收藏
	 * @return:int
	 * @param collectUserId
	 * @param msgId
	 * @return
	 */
	public int cancelCollectThisMsg(String collectUserId, String msgId);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月12日下午12:33:47
	 * @Information:收藏
	 * @return:int
	 * @param collect
	 * @return
	 */
	public int collectThisMsg(Collect collect);

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月10日下午4:15:21
	 * @Information: 统计关注，粉丝，和微校数量
	 * @return:Map<String,Object>
	 * @param userId
	 * @param userType
	 * @return
	 */
	public Map<String, Object> count(String userId, String userType);

	public Map<String, Object> searchMsg(String value, String currentUserid, String currentUserType);

	public Map<String, Object> loadMyMsgList(String userId, String userType, String pageSize, String currentPage);

	public int updateHead(String id, String path);

}
