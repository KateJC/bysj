package com.jkc.msg.entity;

/**
@Author:kjc
@version  @Date:2018年4月6日下午9:56:42
@Information:

*/
import java.util.Date;

public class MsgReply {
	private String id;

	private String msgCommentId;

	private String replyType;

	private String replyId;

	private String replyTargetUserId;

	private String replyUserId;

	private String replyContent;

	private Date replyTime;

	private String replyUserType;

	private String replyTargetUserType;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	public String getMsgCommentId() {
		return msgCommentId;
	}

	public void setMsgCommentId(String msgCommentId) {
		this.msgCommentId = msgCommentId == null ? null : msgCommentId.trim();
	}

	public String getReplyType() {
		return replyType;
	}

	public void setReplyType(String replyType) {
		this.replyType = replyType == null ? null : replyType.trim();
	}

	public String getReplyId() {
		return replyId;
	}

	public void setReplyId(String replyId) {
		this.replyId = replyId == null ? null : replyId.trim();
	}

	public String getReplyTargetUserId() {
		return replyTargetUserId;
	}

	public void setReplyTargetUserId(String replyTargetUserId) {
		this.replyTargetUserId = replyTargetUserId == null ? null : replyTargetUserId.trim();
	}

	public String getReplyUserId() {
		return replyUserId;
	}

	public void setReplyUserId(String replyUserId) {
		this.replyUserId = replyUserId == null ? null : replyUserId.trim();
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent == null ? null : replyContent.trim();
	}

	public Date getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}

	public String getReplyUserType() {
		return replyUserType;
	}

	public void setReplyUserType(String replyUserType) {
		this.replyUserType = replyUserType == null ? null : replyUserType.trim();
	}

	public String getReplyTargetUserType() {
		return replyTargetUserType;
	}

	public void setReplyTargetUserType(String replyTargetUserType) {
		this.replyTargetUserType = replyTargetUserType == null ? null : replyTargetUserType.trim();
	}
}
