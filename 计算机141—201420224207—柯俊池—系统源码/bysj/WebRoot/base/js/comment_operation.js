$(function () {
    /*调用插件，监听评论输入框的大小与字数*/
    <!--textarea高度自适应-->
    // $('.content').flexText();

    <!--点击评论创建评论条  $('.commentAll').on('click', '.plBtn', function () {-->
    /*$('.kjc_content_container').on('click', '.commentAll .plBtn', function () {

    });*/

    <!--点击回复动态创建回复块  创建一个输入框-->
    $('.kjc_content_container').on('click', '.comment-show .pl-hf', function () {
        var replyType = $(this).attr("name");
        //获取回复人的名字
        var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        //回复@
        var fhN = '回复@' + fhName;
        //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
        var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" nane="' + replyType + '" class="hf-pl">评论</a></div>';
        //显示回复
        /*下面的if判断块是为了第一次点击回复就弹出回复框，第二次点击回复就收起回复框*/
        if ($(this).is('.hf-con-block')) {//第一次点击时候，有这个class名，就弹出回复框，然后移除这个class名，第二次点击的时候就没有这个class名，就收起回复框，并且补加上class名，下次点击时候就又有class名了
            $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
            $(this).removeClass('hf-con-block');
            $(this).addClass('font_bold');
            $('.content').flexText();
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding', '6px 15px');
            //input框自动聚焦
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
        } else {
            $(this).addClass('hf-con-block');
            $(this).removeClass('font_bold');
            $(this).parents('.date-dz-right').siblings('.hf-con').remove();
        }
    });

    <!--评论回复块创建  即是生成一个回复-->
    $('.kjc_content_container').on('click', '.comment-show .hf-pl', function () {
        var oThis = $(this);
        var now = getSystemTime();
        //获取输入内容
        var replyType = $(this).attr("name");
        var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();
        var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        var oAllVal = '回复@' + oHfName;
        var oAt = '';
        var replyContent = '';
        if (oHfVal.replace(/^ +| +$/g, '') == '' || oHfVal == oAllVal) {

        } else {
            if (oHfVal.indexOf(":") == -1) {
                replyContent = oHfVal;
                oAt = '回复<a href="javascript:void(0);" class="atName">@' + oHfName + '</a> : ' + oHfVal;
            } else {
                var arr = oHfVal.split(':');
                var content = arr[1];
                var start = arr[0].split('@');
                var hfname = start[1];
                oAt = '回复<a href="javascript:void(0);" class="atName">@' + hfname + '</a> : ' + content;
                replyContent = content;
            }
            var nickname = myStorage.getItem("nickname");
            $.ajax({
                type: "post",
                dataType: "json",
                url: "/bysj/msgController/replyThis.do",
                cache: false,
                async: true,
                data: {
                    msgCommentId: myStorage.getItem("msgCommentId"),
                    replyId: myStorage.getItem("replyId"),
                    replyType: myStorage.getItem("replyType"),
                    replyTargetUserId: myStorage.getItem("replyTargetUserId"),
                    replyTargetUserType: myStorage.getItem("replyTargetUserType"),
                    replyUserType: myStorage.getItem("userType"),
                    replyUserId: myStorage.getItem("id"),
                    replyContent: replyContent,
                },
                success: function (data) {
                    if (data.statusCode == 1000) {
                        var msgReply = data.data;
                        var praiseType = 'reply';
                        var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="javascript:void(0);" class="comment-size-name">' + nickname + ' : </a><span class="my-pl-con">' + oAt + '</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">' + now + '</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:void(0);" class="removeBlock" onclick="deleteThisReply(\'' + data.data.id + '\',this)">删除</a> <a href="javascript:void(0);" nane="reply" class="date-dz-pl pl-hf hf-con-block pull-left" onclick="replyThisReply(\'' + msgReply.msgCommentId + '\',\' ' + msgReply.id + '\',\' ' + msgReply.replyUserId + '\', \'' + msgReply.replyUserType + '\')">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:void(0);" class="date-dz-z pull-left" onclick="praiseThisReply(\'' + msgReply.id + '\',this,\'' + praiseType + '\')"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num"></i>)</a> </div> </div></div>';
                        oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display', 'block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();
                        layer.msg('回复成功');
                    }
                },
                error: function () {
                    layer.msg('回复失败');
                }
            });
        }
    });

    <!--删除评论块 $('.commentAll').on('click', '.removeBlock', function () {-->
    $('.kjc_content_container').on('click', '.commentAll .removeBlock', function () {

    });

    <!--点赞   $('.comment-show').on('click', '.date-dz-z', function () {-->
    $('.kjc_content_container').on('click', '.comment-show .date-dz-z', function () {

    });
    /*点击评论，显示评论列表*/
    /* $('.kjc_content_container').on('click', '.kjc_pl_btn', function () {

     });*/
});

/*评论这条消息*/
var commentThisMsg = function (msgId, $this) {
    var $that = $this;
    //获取当前时间
    var now = getSystemTime();
    //获取当前登录的用户的id
    var activeUserId = myStorage.getItem("id");
    var userType = myStorage.getItem("userType");
    //获取输入内容
    var oSize = $($that).siblings('.flex-text-wrap').find('.comment-input').val();
    //动态创建评论模块
    $.ajax({
        type: "post",
        dataType: "json",
        url: "/bysj/msgController/commentThisMsg.do",
        cache: false,
        async: true,
        data: {
            msgId: msgId,
            userId: activeUserId,
            userType: userType,
            releaseTime: now,
            content: oSize,
        },
        success: function (data) {
            if (data.statusCode == 1000) {
                var praiseType = 'comment';
                var user = '';
                if ('school' == userType || 'club' == userType) {
                    user = data.data.userOfficial;
                } else {
                    user = data.data.userStudent;
                }
                var msgComment = data.data.msgComment;
                oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><a href="javascript:void(0);" title="' + user.nickname + '"><img src="' + user.account_picture + '" alt="" title="' + user.nickname + '" onclick="goToUserMainPage(\'' + userType + '\',\'' + user.id + '\')"></a><input value="' + user.id + '"title="' + userType + '" hidden="hidden"></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="javascript:void(0);" class="comment-size-name">' + user.nickname + ' : </a> <span class="my-pl-con">&nbsp;' + oSize + '</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">' + now + '</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:void(0);" class="removeBlock" onclick="deleteThisComment(\'' + msgComment.id + '\',this)">删除</a> <a href="javascript:void(0);" name="comment" class="date-dz-pl pl-hf hf-con-block pull-left" onclick="replyThisComment(\'' + msgComment.id + '\',\'' + user.id + '\',\'' + userType + '\')">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:void(0);" class="date-dz-z pull-left" onclick="praiseThisComment(\'' + msgComment.id + '\',this,\'' + praiseType + '\')"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num"></i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
                if (oSize.replace(/(^\s*)|(\s*$)/g, "") != '') {
                    $($that).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
                    $($that).siblings('.flex-text-wrap').find('.comment-input').prop('value', '').siblings('pre').find('span').text('');
                    layer.msg('评论成功');
                }
            }
        },
        error: function () {
            layer.msg('评论失败');
        }
    });
};

/*回复这条评论,针对评论的回复
reply_type表示回复的类型，因为回复可以是针对评论的回复(comment)，也可以是针对回复的回复(reply)， 通过这个字段来区分两种情景。
reply_id表示回复目标的id，如果reply_type是comment的话，那么reply_id＝评论id，如果reply_type是reply的话，这表示这条回复的父回复的id。
  reply_id表示回复目标的id
* replyTargetUserId 表示回复目标的用户id
* replyTargetUserType表示回复目标用户类型
*replyUserId表示回复用户的id
* replyUserType  表示回复用户的类型
* */
var replyThisComment = function (msgCommentId, replyTargetUserId, replyTargetUserType) {
    myStorage.setItem("msgCommentId", msgCommentId);
    myStorage.setItem("replyId", msgCommentId);
    myStorage.setItem("replyType", "comment");
    myStorage.setItem("replyTargetUserId", replyTargetUserId);
    myStorage.setItem("replyTargetUserType", replyTargetUserType);
};
/*针对评论中的回复做回复
*reply_type表示回复的类型，因为回复可以是针对评论的回复(comment)，也可以是针对回复的回复(reply)， 通过这个字段来区分两种情景。
*reply_id表示回复目标的id，如果reply_type是comment的话，那么reply_id＝评论id，如果reply_type是reply的话，这表示这条回复的父回复的id。
* reply_id表示回复目标的id
* replyTargetUserId 表示回复目标的用户id
* replyTargetUserType表示回复目标用户类型
*replyUserId表示回复用户的id
* replyUserType  表示回复用户的类型
*
* */
var replyThisReply = function (msgCommentId, replyId, replyTargetUserId, replyTargetUserType) {
    myStorage.setItem("msgCommentId", msgCommentId);
    myStorage.setItem("replyId", replyId);
    myStorage.setItem("replyType", "reply");
    myStorage.setItem("replyTargetUserId", replyTargetUserId);
    myStorage.setItem("replyTargetUserType", replyTargetUserType);
};


/*点赞这条回复*/
var praiseThisReply = function (replyId, $this, praiseType) {
    var $that = $this;
    var zNum = $($this).find('.z-num').html();
    if (if_null(zNum)) {
        zNum = 0;
    }
    if ($($this).is('.date-dz-z-click')) {
        var id = $($that).attr("id");
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/msgController/praiseCancel.do",
            cache: false,
            async: true,
            data: {
                id: id,
            },
            success: function (data) {
                if (data.statusCode == 1000) {
                    zNum--;
                    $($that).attr("id", "");
                    $($that).removeClass('date-dz-z-click red');
                    $($that).find('.z-num').html(zNum);
                    $($that).find('.date-dz-z-click-red').removeClass('red');
                    layer.msg('取消点赞成功');
                }
            },
            error: function () {
                layer.msg('操作失败');
            }
        });
    } else {
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/msgController/praise.do",
            cache: false,
            async: true,
            data: {
                praiseId: replyId,
                praiseType: praiseType,
                praiseUserId: myStorage.getItem("id"),
                praiseUserType: myStorage.getItem("userType"),
            },
            success: function (data) {
                if (data.statusCode == 1000) {
                    var id = data.data;
                    zNum++;
                    $($that).attr("id", id);
                    $($that).addClass('date-dz-z-click');
                    $($that).find('.z-num').html(zNum);
                    $($that).find('.date-dz-z-click-red').addClass('red');
                    layer.msg('点赞成功');
                }
            },
            error: function () {
                layer.msg('操作失败');
            }
        });
    }
};

/*点赞这条评论*/
var praiseThisComment = function (msgCommentId, $this, praiseType) {
    var $that = $this;
    var zNum = $($this).find('.z-num').html();
    if (if_null(zNum)) {
        zNum = 0;
    }
    if ($($this).is('.date-dz-z-click')) {
        var id = $($that).attr("id");
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/msgController/praiseCancel.do",
            cache: false,
            async: true,
            data: {
                id: id,
            },
            success: function (data) {
                if (data.statusCode == 1000) {
                    zNum--;
                    $($that).attr("id", "");
                    $($that).removeClass('date-dz-z-click red');
                    $($that).find('.z-num').html(zNum);
                    $($that).find('.date-dz-z-click-red').removeClass('red');
                    layer.msg('取消点赞成功');
                }
            },
            error: function () {
                layer.msg('取消点赞失败');
            }
        });

    } else {
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/msgController/praise.do",
            cache: false,
            async: true,
            data: {
                praiseId: msgCommentId,
                praiseType: praiseType,
                praiseUserId: myStorage.getItem("id"),
                praiseUserType: myStorage.getItem("userType"),
            },
            success: function (data) {
                if (data.statusCode == 1000) {
                    var id = data.data;
                    zNum++;
                    $($that).addClass('date-dz-z-click');
                    $($that).attr("id", id);
                    $($that).find('.z-num').html(zNum);
                    $($that).find('.date-dz-z-click-red').addClass('red');
                    layer.msg('点赞成功');
                }
            },
            error: function () {
                layer.msg('点赞失败');
            }
        });

    }
};
/*删除这条评论*/
var deleteThisComment = function (msgCommentID, $this) {
    var $that = $this;
    $.ajax({
        type: "post",
        dataType: "json",
        url: "/bysj/msgController/deleteThisComment.do",
        cache: false,
        async: true,
        data: {
            msgCommentID: msgCommentID,
        },
        success: function (data) {
            if (data.statusCode == 1000) {
                var oT = $($that).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
                if (oT.siblings('.all-pl-con').length >= 1) {
                    oT.remove();
                } else {
                    $($that).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display', 'none');
                    oT.remove();
                }
                $($that).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();
                layer.msg('删除成功');
            }
        },
        error: function () {
            layer.msg('删除失败');
        }
    });
};

/*删除回复*/
var deleteThisReply = function (replyId, $this) {
    var $that = $this;
    $.ajax({
        type: "post",
        dataType: "json",
        url: "/bysj/msgController/deleteThisReply.do",
        cache: false,
        async: true,
        data: {
            replyId: replyId,
        },
        success: function (data) {
            if (data.statusCode == 1000) {
                var oT = $($that).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
                if (oT.siblings('.all-pl-con').length >= 1) {
                    oT.remove();
                } else {
                    $($that).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display', 'none');
                    oT.remove();
                }
                $($that).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();
                layer.msg('删除回复成功');
            }
        },
        error: function () {
            layer.msg('删除回复失败');
        }
    });
};

<!--textarea限制字数-->
function keyUP(t) {
    var len = $(t).val().length;
    if (len > 139) {
        $(t).val($(t).val().substring(0, 140));
    }
}
