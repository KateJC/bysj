package com.jkc.msg.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jkc.msg.dao.MsgReplyMapper;
import com.jkc.msg.entity.Collect;
import com.jkc.msg.entity.Follow;
import com.jkc.msg.entity.MsgComment;
import com.jkc.msg.entity.MsgReply;
import com.jkc.msg.entity.Praise;
import com.jkc.msg.service.MsgService;
import com.mchange.v2.log.PackageNames;

import utils.JkReturnJson;
import utils.StringUtil;
import utils.Utils;

/**
 * @Author:kjc
 * @version @Date:2018年4月6日下午10:10:25
 * @Information:
 * 
 */
@Controller
@RequestMapping("/msgController")
public class MsgController {
	@Autowired
	MsgService msgServiceImgl;

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日上午1:04:20
	 * @Information:发布新的帖子
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/postNewMessage")
	@ResponseBody
	public JkReturnJson postNewMessage(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		String content = paramsToMap.get("content");
		String privilege = paramsToMap.get("privilege");
		String contenttype = paramsToMap.get("contenttype");
		String userId = paramsToMap.get("userId");
		String usertype = paramsToMap.get("usertype");
		String picString = paramsToMap.get("picList");
		String faterId = paramsToMap.get("faterId");
		JkReturnJson jkReturnJson = new JkReturnJson();
		if (StringUtil.isNotEmpty(userId)) {
			Map<String, Object> msgMap = msgServiceImgl.saveOriginalMSG(content, contenttype, privilege, userId,
					usertype, picString, faterId);
			jkReturnJson.setData(msgMap);
			jkReturnJson.setStatusCode("1000");
		} else {
			jkReturnJson.setStatusCode("0000");
		}
		return jkReturnJson;

	}

	@RequestMapping("/updateHead")
	@ResponseBody
	public JkReturnJson updateHead(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		JkReturnJson jk = new JkReturnJson();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String path = paramsToMap.get("path");
		int i = msgServiceImgl.updateHead(id, path);
		if (i > 0) {
			jk.setData(i);
			jk.setStatusCode("1000");
		} else {
			jk.setData(null);
			jk.setStatusCode("0000");
			jk.setStatusMsg("操作失败");
		}
		return jk;
	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月8日下午8:31:32
	 * @Information: 评论这条帖子
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/commentThisMsg")
	@ResponseBody
	public JkReturnJson commentThisMsg(HttpServletRequest request, HttpServletResponse response) {
		JkReturnJson jk = new JkReturnJson();
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		String msgId = paramsToMap.get("msgId");
		String userId = paramsToMap.get("userId");
		String userType = paramsToMap.get("userType");
		String releaseTime = paramsToMap.get("releaseTime");
		String content = paramsToMap.get("content");
		MsgComment msgComment = new MsgComment();
		msgComment.setContent(content);
		msgComment.setMsgId(msgId);
		msgComment.setReleaseTime(new Date());
		msgComment.setUserId(userId);
		msgComment.setUserType(userType);
		Map<String, Object> resultsMap = msgServiceImgl.commentThisMsg(msgComment);
		if (resultsMap != null && resultsMap.size() > 0) {
			jk.setData(resultsMap);
			jk.setStatusCode("1000");
		} else {
			jk.setData(null);
			jk.setStatusCode("0000");
			jk.setStatusMsg("操作失败");
		}
		return jk;

	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日上午1:04:00
	 * @Information:删除这条评论
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteThisComment")
	@ResponseBody
	public JkReturnJson deleteThisComment(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		String msgCommentID = paramsToMap.get("msgCommentID");
		JkReturnJson jk = new JkReturnJson();
		if (StringUtil.isNotEmpty(msgCommentID)) {
			int results = msgServiceImgl.deleteThisComment(msgCommentID);
			if (results > 0) {
				jk.setStatusCode("1000");
				jk.setStatusMsg("操作成功");
			} else {
				jk.setStatusCode("0000");
				jk.setStatusMsg("操作失败");
			}
		}
		return jk;

	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日上午12:08:20
	 * @Information: 回复：包括针对评论的回复和针对评论中的回复而做回复
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/replyThis")
	@ResponseBody
	public JkReturnJson replyThis(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		JkReturnJson jk = new JkReturnJson();
		String msgCommentId = paramsToMap.get("msgCommentId");
		String replyId = paramsToMap.get("replyId");
		String replyType = paramsToMap.get("replyType");
		String replyTargetUserId = paramsToMap.get("replyTargetUserId");
		String replyTargetUserType = paramsToMap.get("replyTargetUserType");
		String replyUserType = paramsToMap.get("replyUserType");
		String replyUserId = paramsToMap.get("replyUserId");
		String replyContent = paramsToMap.get("replyContent");
		MsgReply msgReply = new MsgReply();
		msgReply.setMsgCommentId(msgCommentId);
		msgReply.setReplyContent(replyContent);
		msgReply.setReplyId(replyId);
		msgReply.setReplyTargetUserId(replyTargetUserId);
		msgReply.setReplyTargetUserType(replyTargetUserType);
		msgReply.setReplyType(replyType);
		msgReply.setReplyUserId(replyUserId);
		msgReply.setReplyUserType(replyUserType);
		msgReply.setReplyTime(new Date());
		int results = msgServiceImgl.replyThisComment(msgReply);
		if (results > 0) {
			jk.setData(msgReply);
			jk.setStatusCode("1000");
		} else {
			jk.setStatusCode("0000");
		}

		return jk;
	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日上午1:03:42
	 * @Information: 删除这条回复
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteThisReply")
	@ResponseBody
	public JkReturnJson deleteThisReply(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		String replyId = paramsToMap.get("replyId");
		JkReturnJson jk = new JkReturnJson();
		if (StringUtil.isNotEmpty(replyId)) {
			int results = msgServiceImgl.deleteThisReply(replyId);
			if (results > 0) {
				jk.setStatusCode("1000");
				jk.setStatusMsg("操作成功");
			} else {
				jk.setStatusCode("0000");
				jk.setStatusMsg("操作失败");
			}
		}
		return jk;

	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月12日上午11:59:20
	 * @Information: 点赞
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/praise")
	@ResponseBody
	public JkReturnJson praise(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		JkReturnJson jk = new JkReturnJson();
		String praiseId = paramsToMap.get("praiseId");
		String praiseType = paramsToMap.get("praiseType");
		String praiseUserId = paramsToMap.get("praiseUserId");
		String praiseUserType = paramsToMap.get("praiseUserType");
		Praise praise = new Praise();
		praise.setPraiseId(praiseId);
		praise.setPraiseTime(new Date());
		praise.setPraiseType(praiseType);
		praise.setPraiseUserId(praiseUserId);
		praise.setPraiseUserType(praiseUserType);
		int results = msgServiceImgl.praise(praise);
		if (results > 0) {
			jk.setData(praise.getId());
			jk.setStatusCode("1000");
			jk.setStatusMsg("操作成功");
		} else {
			jk.setStatusCode("0000");
			jk.setStatusMsg("操作失败");
		}
		return jk;
	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月12日上午11:59:10
	 * @Information:取消点赞
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/praiseCancel")
	@ResponseBody
	public JkReturnJson praiseCancel(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		JkReturnJson jk = new JkReturnJson();
		String id = paramsToMap.get("id");
		int results = msgServiceImgl.praiseCancel(id);
		if (results > 0) {
			jk.setStatusCode("1000");
			jk.setStatusMsg("操作成功");
		} else {
			jk.setStatusCode("0000");
			jk.setStatusMsg("操作失败");
		}
		return jk;
	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月9日下午10:48:16
	 * @Information: 加载当前用户所关注的用户发的帖子列表
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/queryIndexPageMsgList")
	@ResponseBody
	public JkReturnJson queryIndexPageMsgList(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		String pageSize = paramsToMap.get("pageSize");
		String currentPage = paramsToMap.get("currentPage");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		session.getAttribute("user");
		String userType = (String) session.getAttribute("userType");
		System.out.println(userType);
		System.out.println(id);
		JkReturnJson jk = new JkReturnJson();
		Map<String, Object> resultMap = msgServiceImgl.queryIndexPageMsgList(id, userType, "default", pageSize,
				currentPage);
		if (resultMap != null && resultMap.size() > 0) {
			jk.setData(resultMap);
			jk.setStatusCode("1000");
			jk.setStatusMsg("操作成功");
		} else {
			jk.setStatusCode("0000");
			jk.setStatusMsg("操作失败");
		}

		return jk;
	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月10日下午5:08:21
	 * @Information:查询热门的帖子
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/queryHotMsgList")
	@ResponseBody
	public JkReturnJson queryHotMsgList(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		String pageSize = paramsToMap.get("pageSize");
		String currentPage = paramsToMap.get("currentPage");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		session.getAttribute("user");
		String userType = (String) session.getAttribute("userType");
		System.out.println(userType);
		System.out.println(id);
		JkReturnJson jk = new JkReturnJson();
		Map<String, Object> resultMap = msgServiceImgl.queryIndexPageMsgList(id, userType, "hot", pageSize,
				currentPage);
		if (resultMap != null && resultMap.size() > 0) {
			jk.setData(resultMap);
			jk.setStatusCode("1000");
			jk.setStatusMsg("操作成功");
		} else {
			jk.setStatusCode("0000");
			jk.setStatusMsg("操作失败");
		}

		return jk;
	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月10日下午5:09:35
	 * @Information:查询相互关注的好友的帖子
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/querymyfriendMsgList")
	@ResponseBody
	public JkReturnJson querymyfriendMsgList(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		HttpSession session = request.getSession();
		String pageSize = paramsToMap.get("pageSize");
		String currentPage = paramsToMap.get("currentPage");
		String id = (String) session.getAttribute("id");
		session.getAttribute("user");
		String userType = (String) session.getAttribute("userType");
		System.out.println(userType);
		System.out.println(id);
		JkReturnJson jk = new JkReturnJson();
		try {
			Map<String, Object> resultMap = msgServiceImgl.queryIndexPageMsgList(id, userType, "myFriend", pageSize,
					currentPage);
			jk.setData(resultMap);
			jk.setStatusCode("1000");
			jk.setStatusMsg("操作成功");
		} catch (Exception e) {
			jk.setStatusCode("0000");
			jk.setStatusMsg("操作失败");
			e.printStackTrace();
		} finally {
			return jk;
		}

	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月10日下午5:10:24
	 * @Information:查询我的学校用户发的帖子
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/querymySchoolMsgList")
	@ResponseBody
	public JkReturnJson querymySchoolMsgList(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pageSize = paramsToMap.get("pageSize");
		String currentPage = paramsToMap.get("currentPage");
		session.getAttribute("user");
		String userType = (String) session.getAttribute("userType");
		JkReturnJson jk = new JkReturnJson();
		Map<String, Object> resultMap = msgServiceImgl.queryIndexPageMsgList(id, userType, "mySchool", pageSize,
				currentPage);
		if (resultMap != null && resultMap.size() > 0) {
			jk.setData(resultMap);
			jk.setStatusCode("1000");
			jk.setStatusMsg("操作成功");
		} else {
			jk.setStatusCode("0000");
			jk.setStatusMsg("操作失败");
		}

		return jk;
	}

	@RequestMapping("/loadMyMsgList")
	@ResponseBody
	public JkReturnJson loadMyMsgList(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pageSize = paramsToMap.get("pageSize");
		String currentPage = paramsToMap.get("currentPage");
		session.getAttribute("user");
		String userType = (String) session.getAttribute("userType");
		JkReturnJson jk = new JkReturnJson();
		Map<String, Object> resultMap = msgServiceImgl.loadMyMsgList(id, userType, pageSize, currentPage);
		if (resultMap != null && resultMap.size() > 0) {
			jk.setData(resultMap);
			jk.setStatusCode("1000");
			jk.setStatusMsg("操作成功");
		} else {
			jk.setStatusCode("0000");
			jk.setStatusMsg("操作失败");
		}

		return jk;
	}

	@RequestMapping("/searchMsg")
	@ResponseBody
	public JkReturnJson searchMsg(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String userType = (String) session.getAttribute("userType");
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		JkReturnJson jk = new JkReturnJson();
		String value = paramsToMap.get("value");
		Map<String, Object> resultMap = msgServiceImgl.searchMsg(value, id, userType);
		if (resultMap != null && resultMap.size() > 0) {
			jk.setData(resultMap);
			jk.setStatusCode("1000");
			jk.setStatusMsg("操作成功");
		} else {
			jk.setStatusCode("0000");
			jk.setStatusMsg("操作失败");
		}

		return jk;
	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月12日下午12:15:29
	 * @Information:加载用户点赞过的帖子
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/queryMyPraiseMsgList")
	@ResponseBody
	public JkReturnJson queryMyPraiseMsgList(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pageSize = paramsToMap.get("pageSize");
		String currentPage = paramsToMap.get("currentPage");
		session.getAttribute("user");
		String userType = (String) session.getAttribute("userType");
		System.out.println(userType);
		System.out.println(id);
		JkReturnJson jk = new JkReturnJson();
		try {
			Map<String, Object> resultMap = msgServiceImgl.queryIndexPageMsgList(id, userType, "praise", pageSize,
					currentPage);
			jk.setData(resultMap);
			jk.setStatusCode("1000");
			jk.setStatusMsg("操作成功");
		} catch (Exception e) {
			jk.setStatusCode("0000");
			jk.setStatusMsg("操作失败");
			e.printStackTrace();
		} finally {
			return jk;
		}

	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月12日上午11:58:16
	 * @Information:加载消息的评论
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadCommentOfMsg")
	@ResponseBody
	public JkReturnJson loadCommentOfMsg(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		JkReturnJson jk = new JkReturnJson();
		String msgId = paramsToMap.get("msgId");
		if (StringUtil.isNotEmpty(msgId)) {

			List<Map<String, Object>> commentOfMsgList = msgServiceImgl.loadCommentOfMsg(msgId);
			jk.setData(commentOfMsgList);
			jk.setStatusCode("1000");
		} else {
			jk.setStatusCode("0000");
		}
		return jk;
	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月12日上午11:57:37
	 * @Information:关注或取消关注
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/followUserOperation")
	@ResponseBody
	public JkReturnJson followUserOperation(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		JkReturnJson jk = new JkReturnJson();
		String operationType = paramsToMap.get("operationType");
		String passivityUserType = paramsToMap.get("passivityUserType");
		String initiativeUserType = paramsToMap.get("initiativeUserType");
		String passivityUserId = paramsToMap.get("passivityUserId");
		String initiativeUserID = paramsToMap.get("initiativeUserID");
		int results = 0;
		if ("follow".equals(operationType)) {
			Follow follow = new Follow();
			follow.setInitiativeUserID(initiativeUserID);
			follow.setInitiativeUserType(initiativeUserType);
			follow.setOperationTime(new Date());
			follow.setPassivityUserId(passivityUserId);
			follow.setPassivityUserType(passivityUserType);

			results = msgServiceImgl.followThisUser(follow);

		} else if ("cancelFollow".equals(operationType)) {
			results = msgServiceImgl.cancelFollowThisUser(initiativeUserID, passivityUserId);
		} else {
			jk.setStatusCode("0000");
		}
		if (results > 0) {
			jk.setStatusCode("1000");
		} else {
			jk.setStatusCode("0000");
		}
		return jk;
	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年4月12日下午12:26:54
	 * @Information:收藏或者取消收藏操作
	 * @return:JkReturnJson
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/collectMsgOperation")
	@ResponseBody
	public JkReturnJson collectMsgOperation(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> paramsToMap = Utils.paramsToMap(request);
		JkReturnJson jk = new JkReturnJson();
		String operationType = paramsToMap.get("operationType");
		String collectUserType = paramsToMap.get("collectUserType");
		String msgId = paramsToMap.get("msgId");
		String collectUserId = paramsToMap.get("collectUserId");
		int results = 0;
		if ("follow".equals(operationType)) {
			Collect collect = new Collect();
			collect.setCollectUserType(collectUserType);
			collect.setCollectTime(new Date());
			collect.setMsgId(msgId);
			collect.setCollectUserId(collectUserId);

			results = msgServiceImgl.collectThisMsg(collect);

		} else if ("cancelFollow".equals(operationType)) {
			results = msgServiceImgl.cancelCollectThisMsg(collectUserId, msgId);
		} else {
			jk.setStatusCode("0000");
		}
		if (results > 0) {
			jk.setStatusCode("1000");
		} else {
			jk.setStatusCode("0000");
		}
		return jk;
	}
}
