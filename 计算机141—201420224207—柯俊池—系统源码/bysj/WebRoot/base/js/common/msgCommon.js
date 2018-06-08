/*消息中的三角形浮动操作*/
var show_layer_menu_list = function ($this) {
    if ($($this).find('span').is('.up')) {
        $($this).find('span').removeClass('glyphicon-chevron-down up');
        $($this).find('span').addClass('glyphicon-chevron-up down');
        $($this).next('div').css({
            'display': 'block',
        })
    } else {
        $($this).find('span').removeClass('glyphicon-chevron-up down');
        $($this).find('span').addClass('glyphicon-chevron-down up');
        $($this).next('div').css({
            'display': 'none',
        })
    }


};
/**/
var goToUserMainPage = function (usertype, id) {
    console.log(usertype);
    console.log(id);
};
/**/
var goToSchoolMainPage = function (schoolId) {
    console.log(schoolId)
};
/*加载帖子的评论*/
var loadCommentOfMsg = function (msgId, $this) {
    <!--textarea高度自适应-->
    $('.content').flexText();
    var $that = $this;
    if ($($this).is('.pl_show')) {
        $($this).removeClass('pl_show');
        $($this).parents(".message_bottom").siblings('.commentAll').removeClass("comment_show");
        $($this).parents(".message_bottom").siblings('.commentAll').addClass("comment_hide");
    } else {
        $($this).addClass("pl_show");
        $($this).parents(".message_bottom").siblings('.commentAll').addClass("comment_show");
        $($this).parents(".message_bottom").siblings('.commentAll').removeClass("comment_hide");
        $($this).parents('.message_bottom').siblings('.commentAll').find('.reviewArea textarea').focus();
        //动态创建评论模块
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/msgController/loadCommentOfMsg.do",
            cache: false,
            async: true,
            data: {
                msgId: msgId,
            },
            success: function (data) {
                if (data.statusCode == 1000) {
                    $($that).parents('.message_bottom').siblings('.commentAll').find('.comment-show').empty();
                    var $comment = data.data;
                    for (var i = 0; i < $comment.length; i++) {
                        var $commentMap = $comment[i];
                        var commentUserMap = $commentMap.commentUserMap;
                        var ReplyOfCommentList = $commentMap.ReplyOfCommentList;
                        var replyUserMap = '';
                        var replyTargetUserMap = '';
                        var releaseCommentTime = new Date($commentMap.releaseTime).format("yyyy-MM-dd hh:mm:ss");
                        var praiseType = "comment";
                        var oHtml = $('<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><a href="javascript:void(0);" title="' + commentUserMap.nickname + '"><img src="' + commentUserMap.account_picture + '" alt="" title="' + commentUserMap.nickname + '" onclick="goToUserMainPage(\'' + commentUserMap.user_type + '\',\'' + commentUserMap.id + '\')"></a><input value="' + commentUserMap.id + '"title="' + commentUserMap.user_type + '" hidden="hidden"></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="javascript:void(0);" class="comment-size-name">' + commentUserMap.nickname + ' : </a> <span class="my-pl-con">&nbsp;' + $commentMap.content + '</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">' + releaseCommentTime + '</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:void(0);" class="removeBlock" onclick="deleteThisComment(\'' + $commentMap.id + '\',this)">删除</a> <a href="javascript:void(0);" name="comment" class="date-dz-pl pl-hf hf-con-block pull-left" onclick="replyT' +
                            'hisComment(\'' + $commentMap.id + '\',\'' + commentUserMap.id + '\',\'' + $commentMap.userType + '\')">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:void(0);" class="date-dz-z pull-left" onclick="praiseThisComment(\'' + $commentMap.id + '\',this,\'' + praiseType + '\')"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">' + $commentMap.praiseAmount + '</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>');
                        $($that).parents('.message_bottom').siblings('.commentAll').find('.comment-show').append(oHtml);
                        if (ReplyOfCommentList.length > 0) {
                            for (var j = 0; j < ReplyOfCommentList.length; j++) {
                                var ReplyOfCommentMap = ReplyOfCommentList[j];
                                replyUserMap = ReplyOfCommentMap.replyUserMap;
                                replyTargetUserMap = ReplyOfCommentMap.replyTargetUserMap;
                                var replyTime = new Date(ReplyOfCommentMap.replyTime).format("yyyy-MM-dd hh:mm:ss");
                                var replyPraise = 'reply'
                                var oAt = '回复<a href="javascript:void(0);" class="atName">@' + replyTargetUserMap.nickname + '</a> : ' + ReplyOfCommentMap.replyContent;
                                var replyHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="javascript:void(0);" class="comment-size-name">' + replyUserMap.nickname + ' : </a><span class="my-pl-con">' + oAt + '</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">' + replyTime + '</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:void(0);" class="removeBlock" onclick="deleteThisReply(\'' + ReplyOfCommentMap.id + '\',this)">删除</a> <a href="javascript:void(0);" nane="reply" class="date-dz-pl pl-hf hf-con-block pull-left" onclick="replyThisReply(\'' + $commentMap.id + '\',\' ' + ReplyOfCommentMap.id + '\',\' ' + ReplyOfCommentMap.replyUserId + '\', \'' + ReplyOfCommentMap.replyUserType + '\')">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:void(0);" class="date-dz-z pull-left" onclick="praiseThisReply(\'' + ReplyOfCommentMap.id + '\',this,\'' + replyPraise + '\')"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">' + ReplyOfCommentMap.praiseAmount + '</i>)</a> </div> </div></div>';
                                $(oHtml).find('.comment-show-con-list').find('.hf-list-con').css('display', 'block').append(replyHtml);
                                $(oHtml).find('.comment-show-con-list .date-dz').find('.date-dz-right').find('.pl-hf').addClass('hf-con-block');
                            }
                        }
                    }
                }
            },
            error: function () {
                layer.msg('失败');
            }
        });
    }


};
/*点赞帖子*/
var praiseThisMsg = function ($msgId, $this) {
    if (!if_null(myStorage.getItem("id"))) {
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
                        $($this).removeClass('date-dz-z-click red');
                        $($this).find('.z-num').html(zNum);
                        layer.msg('取消赞成功');
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
                    praiseId: $msgId,
                    praiseType: "msg",
                    praiseUserId: myStorage.getItem("id"),
                    praiseUserType: myStorage.getItem("userType"),
                },
                success: function (data) {
                    if (data.statusCode == 1000) {
                        var id = data.data;
                        zNum++;
                        $($that).attr("id", id);
                        $($that).addClass('date-dz-z-click red');
                        $($that).find('.z-num').html(zNum);
                        layer.msg('点赞成功');
                    }
                },
                error: function () {
                    layer.msg('操作失败');
                }
            });
        }
    } else {
        layer.msg('先登录才能点赞哦,快去登录吧!');
    }
};

/*收藏帖子*/
var collectThisMsg = function ($msgId, $this) {
    console.log($msgId);
    console.log(userId);
};
/*显示转发*/
var transpondThisMsg = function ($msgId) {
    console.log($msgId);
    setTimeout(function () {
        $('#transpondModal').modal('show');
    }, 230);
    $("#transpondModal #fatherId").attr('value', $msgId);

};

/*取消关注*/
var cancelFollowThisUser = function (userId, userType, activeUserId, activeUserType, $this, nickname) {
    if (!if_null(myStorage.getItem("id"))) {
        var $that = $this;
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/msgController/followUserOperation.do",
            cache: false,
            async: true,
            data: {
                initiativeUserID: activeUserId,
                passivityUserId: userId,
                initiativeUserType: activeUserType,
                passivityUserType: userType,
                operationType: 'cancelFollow',
            },
            success: function (data) {
                if (data.statusCode == 1000) {
                    var $li = $($that).parents('.followOperation');
                    $($li).empty();
                    var $follow = '<a href="javascript:void(0)" title="关注' + nickname + '" onclick="followThisUser(\'' + userId + '\',\'' + userType + '\',\'' + activeUserId + '\',\'' + activeUserType + '\',this,\'' + nickname + '\')">关注' + nickname + '</a>';
                    $($li).append($follow);
                    var followNumb = $('.container_bg .part_right .my_inform .followNumb .z-num').html();
                    followNumb--;
                    $('.container_bg .part_right .my_inform .followNumb .z-num').html(followNumb);
                    layer.msg("取消成功");
                }
            }
        });
    } else {
        layer.msg("先登录才能操作哦，快去登录吧!");
    }
};
/*关注*/
var followThisUser = function (userId, userType, activeUserId, activeUserType, $this, nickname) {
    if (!if_null(myStorage.getItem("id"))) {
        var $that = $this;
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/msgController/followUserOperation.do",
            cache: false,
            async: true,
            data: {
                initiativeUserID: activeUserId,
                passivityUserId: userId,
                initiativeUserType: activeUserType,
                passivityUserType: userType,
                operationType: 'follow',
            },
            success: function (data) {
                if (data.statusCode == 1000) {
                    var $li = $($that).parents('.followOperation');
                    $($li).empty();
                    var $follow = '<a href="javascript:void(0)" title="取消关注' + nickname + '" onclick="cancelFollowThisUser(\'' + userId + '\',\'' + userType + '\',\'' + activeUserId + '\',\'' + activeUserType + '\',this,\'' + nickname + '\')">取消关注' + nickname + '</a>';
                    $($li).append($follow);
                    var followNumb = $('.container_bg .part_right .my_inform .followNumb .z-num').html();
                    followNumb++;
                    $('.container_bg .part_right .my_inform .followNumb .z-num').html(followNumb);
                    layer.msg("关注成功");
                }
            }
        });
    } else {
        layer.msg("先登录才能操作哦，快去登录吧!");
    }
};


/*查询热门帖子*/
var queryHotMsgList = function ($this) {
    var $that = $this;
    var pageSize = 15;
    var currentPage = 1;
    var totalpage = 1;
    if (!if_null($that)) {
        pageSize = $($this).parents(".pageDiv").find(".pageSize").attr("value");
        currentPage = parseInt($($this).parents(".pageDiv").find(".currentPage").attr("value")) + 1;
        totalpage = $($this).parents(".pageDiv").find(".total").attr("value");
    }
    if (totalpage < currentPage) {
        layer.msg('已经是最后了');
        return;
    } else {
        if (!if_null($that)) {
            $($this).parents(".pageDiv").find(".currentPage").attr("value", currentPage);
        }
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/msgController/queryHotMsgList.do",
            cache: false,
            async: true,
            data: {
                pageSize: pageSize,
                currentPage: currentPage,
            },
            success: function (data) {
                if (data.statusCode == 1000) {
                    if (if_null($($that))) {
                        $("#all").empty();
                        $("#my_feelings").empty();
                        $("#study").empty();
                        $("#club_activity").empty();
                        $("#obtain_employment").empty();
                    }
                    $(".hot").find(".total").attr("value", data.data.totalPage);
                    var resultsList = data.data.resultsList;
                    var activeUserId = myStorage.getItem("id");
                    var activeUserType = myStorage.getItem("userType");
                    for (var i = 0; i < resultsList.length; i++) {
                        var $msg = resultsList[i];
                        if (!if_null($msg.transpondMsgId)) {
                            transpondmsg($msg);
                        } else {
                            original($msg);
                        }
                    }
                    layer.msg('操作成功');
                    zuley.xiangce({
                        'box': '.xiangce > .list'
                    });
                }
            }
        });
    }
};

/*拼接转发的消息*/
var transpondmsg = function ($msg) {
    var activeUserId = myStorage.getItem("id");
    var activeUserType = myStorage.getItem("userType");
    var $picList = $msg.picList;
    var userMap = $msg.userMap;
    var praiseAmount = $msg.praiseAmount;
    var commentAmount = $msg.commentAmount;
    var $fatherMsg = $msg.fatherMsg;
    var $fatherPicList = $msg.fatherMsg.picList;
    var praiseType = "msg";
    var contentType = $msg.contentType;
    var releaseTime = new Date($msg.releaseTime).format("yyyy-MM-dd hh:mm:ss");
    var $html = $(
        '                        <!--一条帖子上面部分-->\n' +
        '                        <div class="col-sm-12 col-xs-12 message kjc_msg">\n' +
        '                            <!--左边头像部分-->\n' +
        '                            <div class="col-sm-2 col-xs-2">\n' +
        '                                <a href="javascript:void(0);" onclick="goToUserMainPage(\'' + $msg.userType + '\',\'' + userMap.id + '\')">\n' +
        '                                    <img src="' + userMap.account_picture + '" class="kjc_msg_face_img" title="' + userMap.nickname + '">\n' +
        '                                </a>\n' +
        '                            </div>\n' +
        '                            <!-- 右边内容部分-->\n' +
        '                            <div class="col-sm-10 col-xs-10 kjc_msg_content">\n' +
        '                                <!--右边浮动的操作标签-->\n' +
        '                                <div class="WX_FO">\n' +
        '                                    <div class="screen_box">\n' +
        '                                        <a href="javascript:void(0);"\n' +
        '                                           onclick="show_layer_menu_list(this)">\n' +
        '                                            <span class="glyphicon glyphicon-chevron-down up W_ficon"></span>\n' +
        '                                        </a>\n' +
        '                                        <div class="layer_menu_list">\n' +
        '                                            <ul>\n' +
        '                                                <li><a href="javascript:void(0)" title="帮上头条">帮上头条</a></li>\n' +
        '                                                <li><a href="javascript:void(0)" title="屏蔽这条微博">屏蔽这条微博</a></li>\n' +
        '                                                <li><a href="javascript:void(0)" title="屏蔽 东邪西媚">屏蔽 东邪西媚</a></li>\n' +
        '                                                <li class="followOperation"></li>\n' +
        '                                                <li><a href="javascript:void(0);">举报</a>\n' +
        '                                                </li>\n' +
        '                                            </ul>\n' +
        '                                        </div>\n' +
        '                                    </div>\n' +
        '                                </div>\n' +
        '                                <!--右边的顶上部分-->\n' +
        '                                <div class="kjc_user_name">\n' +
        '                    \t\t\t\t\t\t\t\t\t\t<span>\n' +
        '                                            <a href="javascript:void(0)" class="kjc_msg_a kjc_user_a"onclick="goToUserMainPage(\'' + $msg.userType + '\',\'' + userMap.id + '\')">' + userMap.nickname + '</a>\n' +
        '                                        </span>\n' +
        '                                </div>\n' +
        '                                <div class="kjc_msg_info">\n' +
        '                                    <small class="date">\n' +
        '                                        <a href="javascript:void(0)" class="kjc_msg_a">' + releaseTime + '</a>\n' +
        '                                    </small>\n' +
        '                                    <span>来自\n' +
        '                                        <a href="javascript:void(0)" class="kjc_msg_a" onclick="goToSchoolMainPage(\'' + userMap.school_id + '\')">' + userMap.schoolname + '</a>\n' +
        '                                    </span>\n' +
        '                                </div>\n' +
        '                                <!--右边内容部分-->\n' +
        '                                <div class="msg_content">\n' +
        '                                    <!--文字内容部分 -->\n' +
        '                                    <div class="kjc_msg_words">\n' +
        '                  \t\t\t\t\t\t\t\t\t\t\t<span>' +
        $msg.content +
        '                             \t\t\t\t\t\t\t\t\t\t\t</span>\n' +
        '                                    </div>\n' +
        '                                    <!-- 图片部分-->\n' +
        '                                    <div class="kjc_msg_img">\n' +
        '                                        <ul class="col-sm-8 col-xs-12 xiangce">\n' +

        '                                        </ul>\n' +
        '                                    </div>\n' +
        '                                </div>\n' +
        '                            </div>\n' +
        '                        </div>\n' +


        '<!--转发的部分-->\n' +
        '                        <div class="col-sm-12 col-xs-12 transponds">\n' +
        '                            <!--左边头像部分-->\n' +
        '                            <div class="col-sm-2 col-xs-2">\n' +
        '                            </div>\n' +
        '                            <!-- 右边内容部分-->\n' +
        '                            <div class="col-sm-10 col-xs-10 kjc_msg_content">\n' +
        '                                <!--右边的顶上部分-->\n' +
        '                                <div class="kjc_user_name">\n' +
        '                                    <span>\n' +
        '                                        <a href="#" class="kjc_msg_a kjc_user_a">' + $fatherMsg.userMap.nickname + '</a>\n' +
        '                                    </span>\n' +
        '                                </div>\n' +
        '                                <!--右边内容部分-->\n' +
        '                                <div class="msg_content">\n' +
        '                                    <!--文字内容部分 -->\n' +
        '                                    <div class="kjc_msg_words">\n' +
        $fatherMsg.content +
        '                                    </div>\n' +
        '                                    <!-- 图片部分-->\n' +
        '                                    <div class="kjc_msg_img">\n' +
        '                                        <ul class="col-sm-8 col-xs-12 xiangce" id="transpond_xiangce">\n' +

        '                                        </ul>\n' +
        '                                    </div>\n' +
        '                                    <!--转发的帖子信息-->\n' +
        '                                    <div class="kjc_msg_info">\n' +
        '                                        <small class="date">\n' +
        '                                            <a href="#" class="kjc_msg_a">' + new Date($fatherMsg.releaseTime).format("yyyy-MM-dd hh:mm:ss") + '</a>\n' +
        '                                        </small>\n' +
        '                                        <span>\n' +
        '                                        来自<a href="#" class="kjc_msg_a">' + $fatherMsg.userMap.schoolname + '</a>\n' +
        '                                        </span>\n' +
        '                                    </div>\n' +
        '                                    <!--一条转发帖子的底部操作栏-->\n' +
        '                                    <div class="message_bottom">\n' +
        '                                        <div class="kjc_message_operation">\n' +
        '                                            <a href="#" class="kjc_msg_operation_a">\n' +
        '                                                <span class="glyphicon glyphicon-share"></span>\n' +
        '                                                &nbsp;转发<span class="my_badge"></span>\n' +
        '                                            </a>\n' +
        '                                        </div>\n' +
        '                                        <div class="kjc_message_operation">\n' +
        '                                            <a class="kjc_msg_operation_a kjc_pl_btn">\n' +
        '                                                <span class="glyphicon glyphicon-comment"></span>\n' +
        '                                                &nbsp;评论<span class="my_badge"></span>\n' +
        '                                            </a>\n' +
        '                                        </div>\n' +
        '                                        <div class="kjc_message_operation" style="border: none">\n' +
        '                                            <a href="#" class="kjc_msg_operation_a">\n' +
        '                                                <span class="glyphicon glyphicon-heart-empty"></span>\n' +
        '                                                &nbsp;点赞<span class="my_badge"></span>\n' +
        '                                            </a>\n' +
        '                                        </div>\n' +
        '                                    </div>\n' +
        '                                </div>\n' +
        '                            </div>\n' +
        '                        </div>\n' +
        '                        <!--转发结束-->' +


        '                        <!--一条帖子的底部操作栏-->\n' +
        '                        <div class="col-sm-12 col-xs-12 message_bottom">\n' +
        '                            <div class="col-sm-3 col-xs-3 kjc_message_operation">\n' +
        '                                <a href="javascript:void(0);" class="kjc_msg_operation_a" onclick="collectThisMsg(\'' + $msg.id + '\',this)">\n' +
        '                                    <span class="glyphicon glyphicon-star-empty"></span>&nbsp;&nbsp;收藏&nbsp;\n' +
        '                                </a>\n' +
        '                            </div>\n' +
        '                            <div class="col-sm-3 col-xs-3 kjc_message_operation">\n' +
        '                                <a href="javascript:void(0);" class="kjc_msg_operation_a" onclick="transpondThisMsg(\'' + $msg.id + '\',)">\n' +
        '                                    <span class="glyphicon glyphicon-share"></span>&nbsp;&nbsp;转发&nbsp;\n' +
        '                                    <i class="z-num"></i>\n' +
        '                                </a>\n' +
        '                            </div>\n' +
        '                            <div class="col-sm-3 col-xs-3 kjc_message_operation">\n' +
        '                                <a href="javascript:void(0);" class="kjc_msg_operation_a kjc_pl_btn" onclick="loadCommentOfMsg(\'' + $msg.id + '\',this)">\n' +
        '                                    <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;评论&nbsp;\n' +
        '                                    <i class="z-num">' + commentAmount + '</i>\n' +
        '                                </a>\n' +
        '                            </div>\n' +
        '                            <div class="col-sm-3 col-xs-3 kjc_message_operation"\n' +
        '                                 style="border: none">\n' +
        '                                <a href="javascript:void(0);" class="kjc_msg_operation_a praiseMSG"  onclick="praiseThisMsg(\'' + $msg.id + '\',this,\'' + praiseType + '\')">\n' +
        '                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;\n' +
        '                                    <i class="z-num">' + praiseAmount + '</i>\n' +
        '                                </a>\n' +
        '                            </div>\n' +
        '                        </div>\n' +
        '                        <!--一条帖子的评论部分 默认为隐藏起来-->\n' +
        '                        <div class="commentAll col-sm-12 col-xs-12">\n' +
        '                            <!--评论区域 begin-->\n' +
        '                            <div class="reviewArea clearfix">\n' +
        '                                  <textarea class="content comment-input"\n' +
        '                                              placeholder="请输入您的评论，不超过140个字符&hellip;"\n' +
        '                                              onkeyup="keyUP(this)"></textarea>\n' +
        '                                <a href="javascript:void(0);" class="plBtn" onclick="commentThisMsg(\'' + $msg.id + '\',this)">评论</a>\n' +
        '                            </div>\n' +
        '                            <!--评论区域 end-->\n' +
        '                            <!--回复区域 begin-->\n' +
        '                            <div class="comment-show">\n' +

        '                            </div>\n' +
        '                            <!--回复区域 end-->\n' +
        '                        </div>\n');
    if (!if_null($picList)) {
        for (var j = 0; j < $picList.length; j++) {
            var li = $(' <li class="col-sm-4 col-xs-4 kjc_msg_img list">\n' +
                '                                                <img class="mypic" src="' + $picList[j].url + '">\n' +
                '                                            </li>\n');
            $($html).find('.xiangce').append(li);
        }
    }

    if ($fatherPicList != null && $fatherPicList.length > 0) {
        for (var f = 0; f < $fatherPicList.length; f++) {
            var fatherpath = $fatherPicList[f];
            var fatherPicli = $(' <li class="col-sm-4 col-xs-4 kjc_msg_img list">\n' +
                '                                                <img class="mypic" src="' + fatherpath.url + '">\n' +
                '                                            </li>\n');
            $($html).find('#transpond_xiangce').append(fatherPicli);
        }
    }

    var follow = '';
    if ('true' == $msg.ifFollow) {
        follow = '<a href="javascript:void(0)" title="取消关注' + userMap.nickname + '" onclick="cancelFollowThisUser(\'' + userMap.id + '\',\'' + $msg.userType + '\',\'' + activeUserId + '\',\'' + activeUserType + '\',this,\'' + userMap.nickname + '\')">取消关注' + userMap.nickname + '</a>';
    } else if ("false" == $msg.ifFollow) {
        follow = '<a href="javascript:void(0)" title="关注' + userMap.nickname + '" onclick="followThisUser(\'' + userMap.id + '\',\'' + $msg.userType + '\',\'' + activeUserId + '\',\'' + activeUserType + '\',this,\'' + userMap.nickname + '\')">关注' + userMap.nickname + '</a>';
    } else {
        $($html).find('.followOperation').remove();
    }
    $($html).find('.followOperation').append(follow);
    var $div = $(' <!--一条帖子-->\n' +
        '                    <div class="row item_msg">\n' +
        '                    </div>\n' +
        '                    <!--一条帖子结束-->\n');
    var $all = $($div).append($html);
    $("#all").append($all);
    if ('default' == contentType) {
        var $div = $(' <!--一条帖子-->\n' +
            '                    <div class="row item_msg">\n' +
            '                    </div>\n' +
            '                    <!--一条帖子结束-->\n');
        var $my_feelings = $($div).append($html);
        $("#my_feelings").append($my_feelings);
    } else if ('job' == contentType) {
        var $div = $(' <!--一条帖子-->\n' +
            '                    <div class="row item_msg">\n' +
            '                    </div>\n' +
            '                    <!--一条帖子结束-->\n');

        var $obtain_employment = $($div).append($html);
        $("#obtain_employment").append($obtain_employment);
    } else if ('club' == contentType) {
        var $div = $(' <!--一条帖子-->\n' +
            '                    <div class="row item_msg">\n' +
            '                    </div>\n' +
            '                    <!--一条帖子结束-->\n');
        var $club = $($div).append($html);
        $("#club_activity").append($club);
    } else if ('study' == contentType) {
        var $div = $(' <!--一条帖子-->\n' +
            '                    <div class="row item_msg">\n' +
            '                    </div>\n' +
            '                    <!--一条帖子结束-->\n');
        var $study = $($div).append($html);
        $("#study").append($study);
    }

};

/*拼接原创消息*/
var original = function ($msg) {
    var activeUserId = myStorage.getItem("id");
    var activeUserType = myStorage.getItem("userType");
    var $picList = $msg.picList;
    var userMap = $msg.userMap;
    var praiseAmount = $msg.praiseAmount;
    var commentAmount = $msg.commentAmount;
    var praiseType = "msg";
    var contentType = $msg.contentType;
    var releaseTime = new Date($msg.releaseTime).format("yyyy-MM-dd hh:mm:ss");
    var $html = $(
        '                        <!--一条帖子上面部分-->\n' +
        '                        <div class="col-sm-12 col-xs-12 message kjc_msg">\n' +
        '                            <!--左边头像部分-->\n' +
        '                            <div class="col-sm-2 col-xs-2">\n' +
        '                                <a href="javascript:void(0);" onclick="goToUserMainPage(\'' + $msg.userType + '\',\'' + userMap.id + '\')">\n' +
        '                                    <img src="' + userMap.account_picture + '" class="kjc_msg_face_img" title="' + userMap.nickname + '">\n' +
        '                                </a>\n' +
        '                            </div>\n' +
        '                            <!-- 右边内容部分-->\n' +
        '                            <div class="col-sm-10 col-xs-10 kjc_msg_content">\n' +
        '                                <!--右边浮动的操作标签-->\n' +
        '                                <div class="WX_FO">\n' +
        '                                    <div class="screen_box">\n' +
        '                                        <a href="javascript:void(0);"\n' +
        '                                           onclick="show_layer_menu_list(this)">\n' +
        '                                            <span class="glyphicon glyphicon-chevron-down up W_ficon"></span>\n' +
        '                                        </a>\n' +
        '                                        <div class="layer_menu_list">\n' +
        '                                            <ul>\n' +
        '                                                <li><a href="javascript:void(0)" title="帮上头条">帮上头条</a></li>\n' +
        '                                                <li><a href="javascript:void(0)" title="屏蔽这条微博">屏蔽这条微博</a></li>\n' +
        '                                                <li><a href="javascript:void(0)" title="屏蔽 东邪西媚">屏蔽 东邪西媚</a></li>\n' +
        '                                                <li class="followOperation"></li>\n' +
        '                                                <li><a href="javascript:void(0);">举报</a>\n' +
        '                                                </li>\n' +
        '                                            </ul>\n' +
        '                                        </div>\n' +
        '                                    </div>\n' +
        '                                </div>\n' +
        '                                <!--右边的顶上部分-->\n' +
        '                                <div class="kjc_user_name">\n' +
        '                    \t\t\t\t\t\t\t\t\t\t<span>\n' +
        '                                            <a href="javascript:void(0)" class="kjc_msg_a kjc_user_a"onclick="goToUserMainPage(\'' + $msg.userType + '\',\'' + userMap.id + '\')">' + userMap.nickname + '</a>\n' +
        '                                        </span>\n' +
        '                                </div>\n' +
        '                                <div class="kjc_msg_info">\n' +
        '                                    <small class="date">\n' +
        '                                        <a href="javascript:void(0)" class="kjc_msg_a">' + releaseTime + '</a>\n' +
        '                                    </small>\n' +
        '                                    <span>来自\n' +
        '                                        <a href="javascript:void(0)" class="kjc_msg_a" onclick="goToSchoolMainPage(\'' + userMap.school_id + '\')">' + userMap.schoolname + '</a>\n' +
        '                                    </span>\n' +
        '                                </div>\n' +
        '                                <!--右边内容部分-->\n' +
        '                                <div class="msg_content">\n' +
        '                                    <!--文字内容部分 -->\n' +
        '                                    <div class="kjc_msg_words">\n' +
        '                  \t\t\t\t\t\t\t\t\t\t\t<span>' +
        $msg.content +
        '                             \t\t\t\t\t\t\t\t\t\t\t</span>\n' +
        '                                    </div>\n' +
        '                                    <!-- 图片部分-->\n' +
        '                                    <div class="kjc_msg_img">\n' +
        '                                        <ul class="col-sm-8 col-xs-12 xiangce">\n' +

        '                                        </ul>\n' +
        '                                    </div>\n' +
        '                                </div>\n' +
        '                            </div>\n' +
        '                        </div>\n' +
        '                        <!--一条帖子的底部操作栏-->\n' +
        '                        <div class="col-sm-12 col-xs-12 message_bottom">\n' +
        '                            <div class="col-sm-3 col-xs-3 kjc_message_operation">\n' +
        '                                <a href="javascript:void(0);" class="kjc_msg_operation_a" onclick="collectThisMsg(\'' + $msg.id + '\',this)">\n' +
        '                                    <span class="glyphicon glyphicon-star-empty"></span>&nbsp;&nbsp;收藏&nbsp;\n' +
        '                                </a>\n' +
        '                            </div>\n' +
        '                            <div class="col-sm-3 col-xs-3 kjc_message_operation">\n' +
        '                                <a href="javascript:void(0);" class="kjc_msg_operation_a" onclick="transpondThisMsg(\'' + $msg.id + '\',)">\n' +
        '                                    <span class="glyphicon glyphicon-share"></span>&nbsp;&nbsp;转发&nbsp;\n' +
        '                                    <i class="z-num"></i>\n' +
        '                                </a>\n' +
        '                            </div>\n' +
        '                            <div class="col-sm-3 col-xs-3 kjc_message_operation">\n' +
        '                                <a href="javascript:void(0);" class="kjc_msg_operation_a kjc_pl_btn" onclick="loadCommentOfMsg(\'' + $msg.id + '\',this)">\n' +
        '                                    <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;评论&nbsp;\n' +
        '                                    <i class="z-num">' + commentAmount + '</i>\n' +
        '                                </a>\n' +
        '                            </div>\n' +
        '                            <div class="col-sm-3 col-xs-3 kjc_message_operation"\n' +
        '                                 style="border: none">\n' +
        '                                <a href="javascript:void(0);" class="kjc_msg_operation_a praiseMSG"  onclick="praiseThisMsg(\'' + $msg.id + '\',this,\'' + praiseType + '\')">\n' +
        '                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;\n' +
        '                                    <i class="z-num">' + praiseAmount + '</i>\n' +
        '                                </a>\n' +
        '                            </div>\n' +
        '                        </div>\n' +
        '                        <!--一条帖子的评论部分 默认为隐藏起来-->\n' +
        '                        <div class="commentAll col-sm-12 col-xs-12">\n' +
        '                            <!--评论区域 begin-->\n' +
        '                            <div class="reviewArea clearfix">\n' +
        '                                  <textarea class="content comment-input"\n' +
        '                                              placeholder="请输入您的评论，不超过140个字符&hellip;"\n' +
        '                                              onkeyup="keyUP(this)"></textarea>\n' +
        '                                <a href="javascript:void(0);" class="plBtn" onclick="commentThisMsg(\'' + $msg.id + '\',this)">评论</a>\n' +
        '                            </div>\n' +
        '                            <!--评论区域 end-->\n' +
        '                            <!--回复区域 begin-->\n' +
        '                            <div class="comment-show">\n' +

        '                            </div>\n' +
        '                            <!--回复区域 end-->\n' +
        '                        </div>\n');
    if (!if_null($picList)) {
        for (var j = 0; j < $picList.length; j++) {
            var li = $(' <li class="col-sm-4 col-xs-4 kjc_msg_img list">\n' +
                '                                                <img class="mypic" src="' + $picList[j].url + '">\n' +
                '                                            </li>\n');
            $($html).find('.xiangce').append(li);
        }
    }
    var follow = '';
    if ('true' == $msg.ifFollow) {
        follow = '<a href="javascript:void(0)" title="取消关注' + userMap.nickname + '" onclick="cancelFollowThisUser(\'' + userMap.id + '\',\'' + $msg.userType + '\',\'' + activeUserId + '\',\'' + activeUserType + '\',this,\'' + userMap.nickname + '\')">取消关注' + userMap.nickname + '</a>';
    } else if ("false" == $msg.ifFollow) {
        follow = '<a href="javascript:void(0)" title="关注' + userMap.nickname + '" onclick="followThisUser(\'' + userMap.id + '\',\'' + $msg.userType + '\',\'' + activeUserId + '\',\'' + activeUserType + '\',this,\'' + userMap.nickname + '\')">关注' + userMap.nickname + '</a>';
    } else {
        $($html).find('.followOperation').remove();
    }
    $($html).find('.followOperation').append(follow);
    var $div = $(' <!--一条帖子-->\n' +
        '                    <div class="row item_msg">\n' +
        '                    </div>\n' +
        '                    <!--一条帖子结束-->\n');
    var $all = $($div).append($html);
    $("#all").append($all);
    if ('default' == contentType) {
        var $div = $(' <!--一条帖子-->\n' +
            '                    <div class="row item_msg">\n' +
            '                    </div>\n' +
            '                    <!--一条帖子结束-->\n');
        var $my_feelings = $($div).append($html);
        $("#my_feelings").append($my_feelings);
    } else if ('job' == contentType) {
        var $div = $(' <!--一条帖子-->\n' +
            '                    <div class="row item_msg">\n' +
            '                    </div>\n' +
            '                    <!--一条帖子结束-->\n');

        var $obtain_employment = $($div).append($html);
        $("#obtain_employment").append($obtain_employment);
    } else if ('club' == contentType) {
        var $div = $(' <!--一条帖子-->\n' +
            '                    <div class="row item_msg">\n' +
            '                    </div>\n' +
            '                    <!--一条帖子结束-->\n');
        var $club = $($div).append($html);
        $("#club_activity").append($club);
    } else if ('study' == contentType) {
        var $div = $(' <!--一条帖子-->\n' +
            '                    <div class="row item_msg">\n' +
            '                    </div>\n' +
            '                    <!--一条帖子结束-->\n');
        var $study = $($div).append($html);
        $("#study").append($study);
    }

};


var searchMsg = function ($this) {
    var value = $($this).parents(".search").find("input").val();

    $.ajax({
        type: "post",
        dataType: "json",
        url: "/bysj/msgController/searchMsg.do",
        cache: false,
        async: true,
        data: {
            value: value,
        },
        success: function (data) {
            if (data.statusCode == 1000) {
                $("#all").empty();
                $("#my_feelings").empty();
                $("#study").empty();
                $("#club_activity").empty();
                $("#obtain_employment").empty();
                var resultsList = data.data.resultsList;
                var activeUserId = myStorage.getItem("id");
                var activeUserType = myStorage.getItem("userType");
                for (var i = 0; i < resultsList.length; i++) {
                    var $msg = resultsList[i];
                    if (!if_null($msg.transpondMsgId)) {
                        transpondmsg($msg);
                    } else {
                        original($msg);
                    }
                }
                layer.msg('操作成功');
                zuley.xiangce({
                    'box': '.xiangce > .list'
                });
            }
        }
    });
};

/*统计*/
var count = function () {
    $.ajax({
        type: "post",
        dataType: "json",
        url: "/bysj/indexController/count.do",
        cache: false,
        async: true,
        data: {
            userId: myStorage.getItem("id"),
            userType: myStorage.getItem("usetType"),
        },
        success: function (data) {
            if (data.statusCode == 1000) {
                var followNumb = data.data.myFollowNumb;
                var fansNumb = data.data.myFansNumb;
                var myMsgNumb = data.data.myMsgNumb;
                $('.container_bg .count .my_inform .followNumb .z-num').html(followNumb);
                $('.container_bg .count .my_inform .fansNumb .z-num').html(fansNumb);
                $('.container_bg .count .my_inform .myMsgNumb .z-num').html(myMsgNumb);
            }
        }
    });
};