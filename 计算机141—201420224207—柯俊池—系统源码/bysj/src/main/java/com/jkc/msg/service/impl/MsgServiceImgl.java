package com.jkc.msg.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.jdbc.Null;
import org.apache.ibatis.scripting.xmltags.VarDeclSqlNode;
import org.hamcrest.core.Is;
import org.omg.CORBA.PolicyListHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.jkc.loginAndRegister.dao.UserOfficialMapper;
import com.jkc.loginAndRegister.dao.UserStudentMapper;
import com.jkc.loginAndRegister.dao.schoolMapper;
import com.jkc.loginAndRegister.entity.UserStudent;
import com.jkc.msg.controller.MsgController;
import com.jkc.msg.dao.CollectMapper;
import com.jkc.msg.dao.FollowMapper;
import com.jkc.msg.dao.MsgBaseInfoMapper;
import com.jkc.msg.dao.MsgCommentMapper;
import com.jkc.msg.dao.MsgPicMapper;
import com.jkc.msg.dao.MsgQueryMapper;
import com.jkc.msg.dao.MsgReplyMapper;
import com.jkc.msg.dao.PraiseMapper;
import com.jkc.msg.entity.Collect;
import com.jkc.msg.entity.Follow;
import com.jkc.msg.entity.MsgBaseInfo;
import com.jkc.msg.entity.MsgComment;
import com.jkc.msg.entity.MsgPic;
import com.jkc.msg.entity.MsgReply;
import com.jkc.msg.entity.Praise;
import com.jkc.msg.service.MsgService;

import utils.JkReturnJson;
import utils.StringUtil;

/**
 * @Author:kjc
 * @version @Date:2018年4月6日下午10:11:23
 * @Information:
 * 
 */
/**
 * @author kjc
 *
 */
@Service("msgServiceImgl")
public class MsgServiceImgl implements MsgService {
	@Autowired
	MsgBaseInfoMapper msgBaseInfoMapper;
	@Autowired
	MsgPicMapper msgPicMapper;
	@Autowired
	MsgCommentMapper msgCommentMapper;
	@Autowired
	UserStudentMapper userStudentMapper;
	@Autowired
	UserOfficialMapper userOfficialMapper;
	@Autowired
	MsgReplyMapper msgReplyMapper;
	@Autowired
	PraiseMapper praiseMapper;
	@Autowired
	MsgQueryMapper msgQueryMapper;
	@Autowired
	FollowMapper followMapper;
	@Autowired
	CollectMapper collectMapper;

	@Override
	@Transactional
	public Map<String, Object> saveOriginalMSG(String content, String contenttype, String privilege, String id,
			String usertype, String picString, String faterId) {
		Date date = new Date();
		MsgBaseInfo msgBaseInfo = new MsgBaseInfo();
		List<MsgPic> msgPicList = new ArrayList<>();
		msgBaseInfo.setContent(content);
		msgBaseInfo.setContenttype(contenttype);
		msgBaseInfo.setUserid(id);
		msgBaseInfo.setUsertype(usertype);
		msgBaseInfo.setReleasetime(date);
		msgBaseInfo.setPrivilege(privilege);
		msgBaseInfo.setTranspondmsgid(faterId);
		String msgBaseInfoId = "";
		HashMap<String, Object> msgMap;
		Map<String, Object> fatherMsg = null;
		int results = msgBaseInfoMapper.insertSelective(msgBaseInfo);
		if (results > 0) {
			msgBaseInfoId = msgBaseInfo.getId();
			if (StringUtil.isNotEmpty(faterId)) {
				fatherMsg = getFatherMsg(faterId);
			}
			if (StringUtil.isNotEmpty(picString)) {
				String[] pic = picString.split(",");
				for (String path : pic) {
					if (StringUtil.isNotEmpty(path)) {
						MsgPic msgPic = new MsgPic();
						msgPic.setUrl(path);
						msgPic.setReleasetime(date);
						msgPic.setMsgid(msgBaseInfoId);
						msgPic.setId(UUID.randomUUID().toString());
						msgPicList.add(msgPic);
					}

				}
			}
			if (msgPicList != null && msgPicList.size() > 0) {
				int picresults = msgPicMapper.insertListSelective(msgPicList);
				System.out.println("图片保存了" + picresults);
			}
			msgMap = new HashMap<>();
			msgMap.put("fatherMsg", fatherMsg);
			msgMap.put("msgBaseInfo", msgBaseInfo);
			msgMap.put("msgPicList", msgPicList);
		} else {
			msgMap = null;
		}
		return msgMap;
	}

	/**
	 * @Author: kjc
	 * @version: @Date: 2018年5月16日下午6:37:33
	 * @Information:
	 * @return:Map<String,Object>
	 * @param faterId
	 * @return
	 */
	public Map<String, Object> getFatherMsg(String faterId) {
		HashMap<String, Object> fatherMsg = msgQueryMapper.getMsgByid(faterId);
		if (fatherMsg != null) {
			List<Map<String, String>> fatherPicList = msgQueryMapper.queryPicByMsgId(faterId);
			fatherMsg.put("picList", fatherPicList);
			Map<String, Object> fatherUserMap = new HashMap<>();
			if ("school".equals((String) fatherMsg.get("userType"))
					|| "club".equals((String) fatherMsg.get("userType"))) {
				fatherUserMap = userOfficialMapper.selectByPrimaryKey((String) fatherMsg.get("userId")).get(0);
			} else {
				fatherUserMap = userStudentMapper.selectByPrimaryKey((String) fatherMsg.get("userId")).get(0);
			}
			fatherMsg.put("userMap", fatherUserMap);
		}
		return fatherMsg;
	}

	@Override
	public Map<String, Object> commentThisMsg(MsgComment msgComment) {
		HashMap<String, Object> resultsMap = new HashMap<>();
		if (StringUtil.isNotEmpty(msgComment.getContent())) {
			int results = msgCommentMapper.insert(msgComment);
			if (results > 0) {
				resultsMap.put("msgComment", msgComment);
				List<Map<String, Object>> userOfficial = new ArrayList<>();
				List<Map<String, Object>> userStudent = new ArrayList<>();
				if ("school".equals(msgComment.getUserType()) || "club".equals(msgComment.getUserType())) {
					userOfficial = userOfficialMapper.selectByPrimaryKey(msgComment.getUserId());
					resultsMap.put("userOfficial", userOfficial.get(0));
				} else {
					userStudent = userStudentMapper.selectByPrimaryKey(msgComment.getUserId());
					resultsMap.put("userStudent", userStudent.get(0));
				}

			}
		}
		return resultsMap;
	}

	@Override
	public int deleteThisComment(String id) {
		int results = msgCommentMapper.deleteByPrimaryKey(id);
		return results;
	}

	@Override
	public int replyThisComment(MsgReply msgReply) {
		int results = msgReplyMapper.insertSelective(msgReply);
		return results;
	}

	@Override
	public int deleteThisReply(String replyId) {
		int results = msgReplyMapper.deleteByPrimaryKey(replyId);
		return results;
	}

	@Override
	public int praise(Praise praise) {
		int results = praiseMapper.insertSelective(praise);
		return results;
	}

	@Override
	public int praiseCancel(String id) {
		int results = praiseMapper.deleteByPrimaryKey(id);
		return results;
	}

	public int quMo(int total, int pagesize) {
		if (total % pagesize == 0) {
			return total / pagesize;
		}
		return (total / pagesize) + 1;
	}

	@Override
	public Map<String, Object> queryIndexPageMsgList(String currentUserid, String currentUserType, String queryType,
			String pageSize, String currentPage) {
		Map<String, Object> resultMap = new HashMap<>();
		List<Map<String, Object>> resultsList = null;
		int totalPage = 0;
		if ("default".equals(queryType)) {
			resultsList = msgQueryMapper.queryMyFollowMsgListPublic(currentUserid,
					(Integer.valueOf(currentPage) - 1) * Integer.valueOf(pageSize), Integer.valueOf(pageSize));
			totalPage = quMo(msgQueryMapper.queryMyFollowMsgListPublicTotal(currentUserid), Integer.valueOf(pageSize));
		} else if ("hot".equals(queryType)) {
			resultsList = msgQueryMapper.queryAllMsgListPublic(
					((Integer.valueOf(currentPage) - 1) * Integer.valueOf(pageSize)), Integer.valueOf(pageSize));
			totalPage = quMo(msgQueryMapper.queryAllMsgListPublicTotal(), Integer.valueOf(pageSize));
		} else if ("mySchool".equals(queryType)) {
			Map<String, Object> userMap;
			if ("school".equals(currentUserType) || "club".equals(currentUserType)) {
				userMap = userOfficialMapper.selectByPrimaryKey(currentUserid).get(0);
			} else {
				userMap = userStudentMapper.selectByPrimaryKey(currentUserid).get(0);
			}
			String schoolId = (String) userMap.get("school_id");
			resultsList = msgQueryMapper.queryMySchoolMsgListPublic(schoolId,
					(Integer.valueOf(currentPage) - 1) * Integer.valueOf(pageSize), Integer.valueOf(pageSize));
			totalPage = quMo(msgQueryMapper.queryMySchoolMsgListPublicTotal(schoolId), Integer.valueOf(pageSize));
		} else if ("myFriend".equals(queryType)) {
			resultsList = msgQueryMapper.queryMyFriendMsgListPublic(currentUserid,
					(Integer.valueOf(currentPage) - 1) * Integer.valueOf(pageSize), Integer.valueOf(pageSize));
			totalPage = quMo(msgQueryMapper.queryMyFriendMsgListPublicTotal(currentUserid), Integer.valueOf(pageSize));
		} else if ("praise".equals(queryType)) {
			resultsList = msgQueryMapper.queryMyPraiseMsgList(currentUserid,
					(Integer.valueOf(currentPage) - 1) * Integer.valueOf(pageSize), Integer.valueOf(pageSize));
			totalPage = quMo(msgQueryMapper.queryMyPraiseMsgListTotal(currentUserid), Integer.valueOf(pageSize));
		}

		if (resultsList != null && resultsList.size() > 0) {
			for (int i = 0; i < resultsList.size(); i++) {
				Map<String, Object> msgMap = resultsList.get(i);
				String userId = (String) msgMap.get("userId");
				String userType = (String) msgMap.get("userType");
				List<Map<String, Object>> checkIfFollowResults = followMapper.checkIfFollow(currentUserid, userId);
				if (checkIfFollowResults != null && checkIfFollowResults.size() > 0) {
					msgMap.put("ifFollow", "true");
				} else {
					msgMap.put("ifFollow", "false");
				}
				Map<String, Object> userMap;
				if ("school".equals(userType) || "club".equals(userType)) {
					userMap = userOfficialMapper.selectByPrimaryKey(userId).get(0);
				} else {
					userMap = userStudentMapper.selectByPrimaryKey(userId).get(0);
				}
				String id = (String) msgMap.get("id");
				int msgPraiseAmount = msgQueryMapper.queryMsgPraiseAmount(id, "msg");
				int commentAmount = msgQueryMapper.queryMsgCommentAmount(id, "msg");
				msgMap.put("praiseAmount", msgPraiseAmount);
				msgMap.put("commentAmount", commentAmount);
				msgMap.put("userMap", userMap);
				List<Map<String, String>> picList = msgQueryMapper.queryPicByMsgId(id);
				if (picList != null && picList.size() > 0) {
					msgMap.put("picList", picList);
				}
				if (StringUtil.isNotEmpty((String) msgMap.get("transpondMsgId"))) {
					Map<String, Object> fatherMsg = getFatherMsg((String) msgMap.get("transpondMsgId"));
					msgMap.put("fatherMsg", fatherMsg);
				}
			}

		}
		resultMap.put("resultsList", resultsList);
		resultMap.put("totalPage", totalPage);

		return resultMap;
	}

	public Map<String, Object> searchMsg(String value, String currentUserid, String currentUserType) {
		Map<String, Object> resultMap = new HashMap<>();
		List<Map<String, Object>> resultsList = null;
		resultsList = msgQueryMapper.searchMsg(value);

		if (resultsList != null && resultsList.size() > 0) {
			for (int i = 0; i < resultsList.size(); i++) {
				Map<String, Object> msgMap = resultsList.get(i);
				String userId = (String) msgMap.get("userId");
				String userType = (String) msgMap.get("userType");
				// List<Map<String, Object>> checkIfFollowResults =
				// followMapper.checkIfFollow(currentUserid, userId);
				// if (checkIfFollowResults != null &&
				// checkIfFollowResults.size() > 0) {
				// msgMap.put("ifFollow", "true");
				// } else {
				msgMap.put("ifFollow", "false");
				// }
				Map<String, Object> userMap;
				if ("school".equals(userType) || "club".equals(userType)) {
					userMap = userOfficialMapper.selectByPrimaryKey(userId).get(0);
				} else {
					userMap = userStudentMapper.selectByPrimaryKey(userId).get(0);
				}
				String id = (String) msgMap.get("id");
				int msgPraiseAmount = msgQueryMapper.queryMsgPraiseAmount(id, "msg");
				int commentAmount = msgQueryMapper.queryMsgCommentAmount(id, "msg");
				msgMap.put("praiseAmount", msgPraiseAmount);
				msgMap.put("commentAmount", commentAmount);
				msgMap.put("userMap", userMap);
				List<Map<String, String>> picList = msgQueryMapper.queryPicByMsgId(id);
				if (picList != null && picList.size() > 0) {
					msgMap.put("picList", picList);
				}
				if (StringUtil.isNotEmpty((String) msgMap.get("transpondMsgId"))) {
					Map<String, Object> fatherMsg = getFatherMsg((String) msgMap.get("transpondMsgId"));
					msgMap.put("fatherMsg", fatherMsg);
				}
			}

		}
		resultMap.put("resultsList", resultsList);

		return resultMap;
	}

	@Override
	public Map<String, Object> loadMyMsgList(String currentUserid, String currentUserType, String pageSize,
			String currentPage) {
		Map<String, Object> resultMap = new HashMap<>();
		List<Map<String, Object>> resultsList = null;
		resultsList = msgQueryMapper.loadMyMsgList(currentUserid);

		if (resultsList != null && resultsList.size() > 0) {
			for (int i = 0; i < resultsList.size(); i++) {
				Map<String, Object> msgMap = resultsList.get(i);
				String userId = (String) msgMap.get("userId");
				String userType = (String) msgMap.get("userType");
				// List<Map<String, Object>> checkIfFollowResults =
				// followMapper.checkIfFollow(currentUserid, userId);
				// if (checkIfFollowResults != null &&
				// checkIfFollowResults.size() > 0) {
				// msgMap.put("ifFollow", "true");
				// } else {
				msgMap.put("ifFollow", "false");
				// }
				Map<String, Object> userMap;
				if ("school".equals(userType) || "club".equals(userType)) {
					userMap = userOfficialMapper.selectByPrimaryKey(userId).get(0);
				} else {
					userMap = userStudentMapper.selectByPrimaryKey(userId).get(0);
				}
				String id = (String) msgMap.get("id");
				int msgPraiseAmount = msgQueryMapper.queryMsgPraiseAmount(id, "msg");
				int commentAmount = msgQueryMapper.queryMsgCommentAmount(id, "msg");
				msgMap.put("praiseAmount", msgPraiseAmount);
				msgMap.put("commentAmount", commentAmount);
				msgMap.put("userMap", userMap);
				List<Map<String, String>> picList = msgQueryMapper.queryPicByMsgId(id);
				if (picList != null && picList.size() > 0) {
					msgMap.put("picList", picList);
				}
				if (StringUtil.isNotEmpty((String) msgMap.get("transpondMsgId"))) {
					Map<String, Object> fatherMsg = getFatherMsg((String) msgMap.get("transpondMsgId"));
					msgMap.put("fatherMsg", fatherMsg);
				}
			}

		}
		resultMap.put("resultsList", resultsList);

		return resultMap;
	}

	@Override
	public List<Map<String, Object>> loadCommentOfMsg(String msgId) {
		List<Map<String, Object>> commentOfMsgList = msgQueryMapper.loadCommentOfMsg(msgId);
		if (commentOfMsgList != null && commentOfMsgList.size() > 0) {
			for (int i = 0; i < commentOfMsgList.size(); i++) {
				Map<String, Object> commentOfMsgMap = commentOfMsgList.get(i);
				String userId = (String) commentOfMsgMap.get("userId");
				String userType = (String) commentOfMsgMap.get("userType");
				Map<String, Object> commentUserMap;
				String commentId = (String) commentOfMsgMap.get("id");
				if ("school".equals(userType) || "club".equals(userType)) {
					commentUserMap = userOfficialMapper.selectByPrimaryKey(userId).get(0);
				} else {
					commentUserMap = userStudentMapper.selectByPrimaryKey(userId).get(0);
				}
				int commentPraiseAmount = msgQueryMapper.queryMsgPraiseAmount(commentId, "comment");
				commentOfMsgMap.put("praiseAmount", commentPraiseAmount);
				commentOfMsgMap.put("commentUserMap", commentUserMap);
				List<Map<String, Object>> ReplyOfCommentList = new ArrayList<>();
				ReplyOfCommentList = msgQueryMapper.loadReplyOfComment(commentId, "comment");
				if (ReplyOfCommentList != null && ReplyOfCommentList.size() > 0) {
					for (int j = 0; j < ReplyOfCommentList.size(); j++) {
						Map<String, Object> ReplyOfCommentMap = ReplyOfCommentList.get(j);
						String replyUserType = (String) ReplyOfCommentMap.get("replyUserType");
						String replyUserId = (String) ReplyOfCommentMap.get("replyUserId");
						String replyTargetUserId = (String) ReplyOfCommentMap.get("replyTargetUserId");
						String replyTargetUserType = (String) ReplyOfCommentMap.get("replyTargetUserType");

						Map<String, Object> replyUserMap;
						Map<String, Object> replyTargetUserMap;
						if ("school".equals(replyUserType) || "club".equals(replyUserType)) {
							replyUserMap = userOfficialMapper.selectByPrimaryKey(replyUserId).get(0);
						} else {
							replyUserMap = userStudentMapper.selectByPrimaryKey(replyUserId).get(0);
						}
						if ("school".equals(replyTargetUserType) || "club".equals(replyTargetUserType)) {
							replyTargetUserMap = userOfficialMapper.selectByPrimaryKey(replyTargetUserId).get(0);
						} else {
							replyTargetUserMap = userStudentMapper.selectByPrimaryKey(replyTargetUserId).get(0);
						}
						int replyPraiseAmount = msgQueryMapper
								.queryMsgPraiseAmount((String) ReplyOfCommentMap.get("id"), "reply");
						ReplyOfCommentMap.put("replyUserMap", replyUserMap);
						ReplyOfCommentMap.put("replyTargetUserMap", replyTargetUserMap);
						ReplyOfCommentMap.put("praiseAmount", replyPraiseAmount);

					}

				}
				commentOfMsgMap.put("ReplyOfCommentList", ReplyOfCommentList);

			}
		}

		return commentOfMsgList;
	}

	@Override
	public List<Map<String, Object>> selectWefollowOnEachOther(String userId, String userType) {
		List<Map<String, Object>> followOnEachOtherList = followMapper.selectWefollowOnEachOther(userId);
		if (followOnEachOtherList != null && followOnEachOtherList.size() > 0) {
			Map<String, Object> myUserMap;
			if ("school".equals(userType) || "club".equals(userType)) {
				myUserMap = userOfficialMapper.selectByPrimaryKey(userId).get(0);
			} else {
				myUserMap = userStudentMapper.selectByPrimaryKey(userId).get(0);
			}
			for (int i = 0; i < followOnEachOtherList.size(); i++) {
				Map<String, Object> followOnEachOtherMap = followOnEachOtherList.get(i);
				String initiativeUserID = (String) followOnEachOtherMap.get("initiativeUserID");
				String initiativeUserType = (String) followOnEachOtherMap.get("initiativeUserType");
				Map<String, Object> myFriendUserMap;
				if ("school".equals(initiativeUserType) || "club".equals(initiativeUserType)) {
					myFriendUserMap = userOfficialMapper.selectByPrimaryKey(initiativeUserID).get(0);
				} else {
					myFriendUserMap = userStudentMapper.selectByPrimaryKey(initiativeUserID).get(0);
				}
				followOnEachOtherMap.put("myFriendUserMap", myFriendUserMap);
				followOnEachOtherMap.put("myUserMap", myUserMap);
			}

		}

		return followOnEachOtherList;
	}

	@Override
	public List<Map<String, Object>> selectMyFollow(String userId, String userType) {
		List<Map<String, Object>> myFollowList = followMapper.selectMyFollow(userId);
		if (myFollowList != null && myFollowList.size() > 0) {
			Map<String, Object> myUserMap;
			if ("school".equals(userType) || "club".equals(userType)) {
				myUserMap = userOfficialMapper.selectByPrimaryKey(userId).get(0);
			} else {
				myUserMap = userStudentMapper.selectByPrimaryKey(userId).get(0);
			}
			for (int i = 0; i < myFollowList.size(); i++) {
				Map<String, Object> myFollowMap = myFollowList.get(i);

				String passivityUserId = (String) myFollowMap.get("passivityUserId");
				String passivityUserType = (String) myFollowMap.get("passivityUserType");
				Map<String, Object> myFollowUserMap;
				if ("school".equals(passivityUserType) || "club".equals(passivityUserType)) {
					myFollowUserMap = userOfficialMapper.selectByPrimaryKey(passivityUserId).get(0);
				} else {
					myFollowUserMap = userStudentMapper.selectByPrimaryKey(passivityUserId).get(0);
				}
				myFollowMap.put("myFollowUserMap", myFollowUserMap);
				myFollowMap.put("myUserMap", myUserMap);
			}
		}
		return myFollowList;
	}

	@Override
	public List<Map<String, Object>> selectMyFans(String userId, String userType) {
		List<Map<String, Object>> myFansList = followMapper.selectMyFans(userId);
		if (myFansList != null && myFansList.size() > 0) {
			Map<String, Object> myUserMap;
			if ("school".equals(userType) || "club".equals(userType)) {
				myUserMap = userOfficialMapper.selectByPrimaryKey(userId).get(0);
			} else {
				myUserMap = userStudentMapper.selectByPrimaryKey(userId).get(0);
			}
			for (int i = 0; i < myFansList.size(); i++) {
				Map<String, Object> myFansMap = myFansList.get(i);

				String initiativeUserID = (String) myFansMap.get("initiativeUserID");
				String initiativeUserType = (String) myFansMap.get("initiativeUserType");
				Map<String, Object> myFansUserMap;
				if ("school".equals(initiativeUserType) || "club".equals(initiativeUserType)) {
					myFansUserMap = userOfficialMapper.selectByPrimaryKey(initiativeUserID).get(0);
				} else {
					myFansUserMap = userStudentMapper.selectByPrimaryKey(initiativeUserID).get(0);
				}
				myFansMap.put("myFollowUserMap", myFansUserMap);
				myFansMap.put("myUserMap", myUserMap);
			}
		}
		return myFansList;
	}

	@Override
	public int followThisUser(Follow follow) {
		int results = followMapper.insert(follow);
		return results;
	}

	@Override
	public int cancelFollowThisUser(String initiativeUserID, String passivityUserId) {
		int results = followMapper.cancelFollowThisUser(initiativeUserID, passivityUserId);
		return results;
	}

	@Override
	public Map<String, Object> count(String userId, String userType) {
		int countMyFansNumb = followMapper.countMyFansNumb(userId);
		int countMyFollowNumb = followMapper.countMyFollowNumb(userId);
		int countMyMsgNumb = msgBaseInfoMapper.countMyMsgNumb(userId);
		Map<String, Object> countMap = new HashMap<>();
		countMap.put("myFansNumb", countMyFansNumb);
		countMap.put("myFollowNumb", countMyFollowNumb);
		countMap.put("myMsgNumb", countMyMsgNumb);
		return countMap;
	}

	@Override
	public int cancelCollectThisMsg(String collectUserId, String msgId) {
		int results = collectMapper.delectCollect(collectUserId, msgId);
		return results;
	}

	@Override
	public int collectThisMsg(Collect collect) {
		int results = collectMapper.insert(collect);
		return results;
	}

	@Override
	public int updateHead(String id, String path) {
		int i = userStudentMapper.updateHead(id, path);
		return i;
	}

}
