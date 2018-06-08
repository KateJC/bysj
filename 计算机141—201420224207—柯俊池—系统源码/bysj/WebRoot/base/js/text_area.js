$(function () {

    $("#content").keyup(function () {

        //判断输入的字符串长度
        var content_len = $("#content").text().replace(/\s/g, "").length;

        $(".tips").text("已经输入" + content_len + "个字");


        if (content_len == 0) {
            // alert(content);
            $(".tips").text("");
            $("#send").addClass("disabled");
            return false;
        } else {
            $("#send").removeClass("disabled");
        }
    });
    /*转发统计字数*/
    $("#transpond_content").keyup(function () {

        //判断输入的字符串长度
        var content_len = $("#transpond_content").text().replace(/\s/g, "").length;

        $(".tips").text("已经输入" + content_len + "个字");


        if (content_len == 0) {
            // alert(content);
            $(".tips").text("");
            $("#transpond_send").addClass("disabled");
            return false;
        } else {
            $("#transpond_send").removeClass("disabled");
        }
    });

    /*发布消息上传图片*/
    $(".pic").click(function () {
        if ($("#layer_upload").is(".display_none")) {
            $("#layer_upload").removeClass("display_none");
            $("#layer_upload").addClass("display_block");
        } else if ($("#layer_upload").is(".display_block")) {
            $("#layer_upload").removeClass("display_block");
            $("#layer_upload").addClass("display_none");
        }

    });
    /*转发消息上传图片*/
    $(".transpond_pic").click(function () {
        if ($("#transpond_layer_upload").is(".display_none")) {
            $("#transpond_layer_upload").removeClass("display_none");
            $("#transpond_layer_upload").addClass("display_block");
        } else if ($("#transpond_layer_upload").is(".display_block")) {
            $("#transpond_layer_upload").removeClass("display_block");
            $("#transpond_layer_upload").addClass("display_none");
        }

    });


    //点击按钮发送内容
    //发送原创消息
    $(".my_edit").on("click", "#send", function () {
        var usertype = myStorage.getItem('userType');
        var clubname = '';
        var admintype = '';
        if (!if_null(usertype) && 'club' == usertype) {
            clubname = myStorage.getItem("clubname")
            admintype = myStorage.getItem('admintype');
        }
        var userId = myStorage.getItem('id');
        var nickname = myStorage.getItem("nickname");
        myStorage.getItem("phone");
        myStorage.getItem("password");
        var schoolname = myStorage.getItem("schoolname");
        var schoolId = myStorage.getItem("schoolId");

        var now = getSystemTime();
        var privilege = $('#edit_form').find('#privilege_select option:selected').val();
        var contenttype = $('#edit_form').find('#msgType_select option:selected').val();
        var content = $("#content").html();
        /*上传图片*/
        var img_list_path = upload_Img();
        console.log(img_list_path);
        var path = '';
        if (img_list_path.length > 0) {
            for (var k = 0; k < img_list_path.length; k++) {
                path = path + img_list_path[k] + ',';
            }
        }
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/msgController/postNewMessage.do",
            cache: false,
            async: true,
            data: {
                content: content,
                privilege: privilege,
                contenttype: contenttype,
                userId: userId,
                usertype: usertype,
                picList: path,
            },
            success: function (data) {
                if (data.statusCode == 1000) {
                    var $msg = data.data.msgBaseInfo;
                    var $picList = data.data.msgPicList;
                    var praiseType = "msg";


                    var $html = $(
                        '                        <!--一条帖子上面部分-->\n' +
                        '                        <div class="col-sm-12 col-xs-12 message kjc_msg">\n' +
                        '                            <!--左边头像部分-->\n' +
                        '                            <div class="col-sm-2 col-xs-2">\n' +
                        '                                <a href="javascript:void(0)" onclick="goToUserMainPage(\'' + usertype + '\',\'' + userId + '\')">\n' +
                        '                                    <img src="img/icon.png" class="kjc_msg_face_img" title="' + nickname + '">\n' +
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
                        '                                                <li><a href="javascript:void(0)" title="取消关注东邪西媚">取消关注东邪西媚</a></li>\n' +
                        '                                                <li><a href="javascript:void(0);">举报</a>\n' +
                        '                                                </li>\n' +
                        '                                            </ul>\n' +
                        '                                        </div>\n' +
                        '                                    </div>\n' +
                        '                                </div>\n' +
                        '                                <!--右边的顶上部分-->\n' +
                        '                                <div class="kjc_user_name">\n' +
                        '                    \t\t\t\t\t\t\t\t\t\t<span>\n' +
                        '                                            <a href="javascript:void(0)" class="kjc_msg_a kjc_user_a"onclick="goToUserMainPage(\'' + usertype + '\',\'' + userId + '\')">' + nickname + '</a>\n' +
                        '                                        </span>\n' +
                        '                                </div>\n' +
                        '                                <div class="kjc_msg_info">\n' +
                        '                                    <small class="date">\n' +
                        '                                        <a href="javascript:void(0)" class="kjc_msg_a">' + now + '</a>\n' +
                        '                                    </small>\n' +
                        '                                    <span>来自\n' +
                        '                                        <a href="javascript:void(0)" class="kjc_msg_a" onclick="goToSchoolMainPage(\'' + schoolId + '\')">' + schoolname + '</a>\n' +
                        '                                    </span>\n' +
                        '                                </div>\n' +
                        '                                <!--右边内容部分-->\n' +
                        '                                <div class="msg_content">\n' +
                        '                                    <!--文字内容部分 -->\n' +
                        '                                    <div class="kjc_msg_words">\n' +
                        '                  \t\t\t\t\t\t\t\t\t\t\t<span>' +
                        content +
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
                        '                                    <i class="z-num"></i>\n' +
                        '                                </a>\n' +
                        '                            </div>\n' +
                        '                            <div class="col-sm-3 col-xs-3 kjc_message_operation"\n' +
                        '                                 style="border: none">\n' +
                        '                                <a href="javascript:void(0);" class="kjc_msg_operation_a praiseMSG"  onclick="praiseThisMsg(\'' + $msg.id + '\',this,\'' + praiseType + '\')">\n' +
                        '                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;\n' +
                        '                                    <i class="z-num"></i>\n' +
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

                    for (var i = 0; i < img_list_path.length; i++) {
                        var path = img_list_path[i];
                        var li = $(' <li class="col-sm-4 col-xs-4 kjc_msg_img list">\n' +
                            '                                                <img class="mypic" src="' + path + '">\n' +
                            '                                            </li>\n');
                        $($html).find('.xiangce').append(li);
                    }

                    var $div = $(' <!--一条帖子-->\n' +
                        '                    <div class="row item_msg">\n' +
                        '                    </div>\n' +
                        '                    <!--一条帖子结束-->\n');
                    var $all = $($div).append($html);
                    $("#all").prepend($all);
                    if ('default' == contenttype) {
                        var $div = $(' <!--一条帖子-->\n' +
                            '                    <div class="row item_msg">\n' +
                            '                    </div>\n' +
                            '                    <!--一条帖子结束-->\n');
                        var $my_feelings = $($div).append($html);
                        $("#my_feelings").prepend($my_feelings);
                    } else if ('job' == contenttype) {
                        var $div = $(' <!--一条帖子-->\n' +
                            '                    <div class="row item_msg">\n' +
                            '                    </div>\n' +
                            '                    <!--一条帖子结束-->\n');

                        var $obtain_employment = $($div).append($html);
                        $("#obtain_employment").prepend($obtain_employment);
                    } else if ('club' == contenttype) {
                        var $div = $(' <!--一条帖子-->\n' +
                            '                    <div class="row item_msg">\n' +
                            '                    </div>\n' +
                            '                    <!--一条帖子结束-->\n');
                        var $club = $($div).append($html);
                        $("#club_activity").prepend($club);
                    } else if ('study' == contenttype) {
                        var $div = $(' <!--一条帖子-->\n' +
                            '                    <div class="row item_msg">\n' +
                            '                    </div>\n' +
                            '                    <!--一条帖子结束-->\n');
                        var $study = $($div).append($html);
                        $("#study").prepend($study);
                    }

                    zuley.xiangce({
                        'box': '.xiangce > .list'
                    });
                    $("#content").empty();
                    layer.msg('发布成功');
                    $("#layer_upload .imgAll ul").empty();
                    $("#layer_upload").removeClass("display_block");
                    $("#layer_upload").addClass("display_none");
                } else {
                    layer.msg('发布失败');
                }
            },
            error: function () {
                layer.msg('发布失败');
            }
        });

    });


    /*点击发送你个转发消息*/
    $("#transpond_edit_form").on("click", "#transpond_send", function () {
        var usertype = myStorage.getItem('userType');
        var clubname = '';
        var admintype = '';
        if (!if_null(usertype) && 'club' == usertype) {
            clubname = myStorage.getItem("clubname")
            admintype = myStorage.getItem('admintype');
        }
        var userId = myStorage.getItem('id');
        var nickname = myStorage.getItem("nickname");
        myStorage.getItem("phone");
        myStorage.getItem("password");
        var schoolname = myStorage.getItem("schoolname");
        var schoolId = myStorage.getItem("schoolId");

        var now = getSystemTime();
        var privilege = $('#transpond_edit_form').find('#transpond_privilege_select option:selected').val();
        var contenttype = $('#transpond_edit_form').find('#transpond_msgType_select option:selected').val();
        var content = $("#transpond_content").html();
        var faterId = $("#transpondModal #fatherId").attr('value');
        /*上传图片*/
        var img_list_path = upload_transpond_Img();
        console.log(img_list_path);
        var path = '';
        if (img_list_path.length > 0) {
            for (var k = 0; k < img_list_path.length; k++) {
                path = path + img_list_path[k] + ',';
            }
        }
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/msgController/postNewMessage.do",
            cache: false,
            async: true,
            data: {
                content: content,
                privilege: privilege,
                contenttype: contenttype,
                userId: userId,
                usertype: usertype,
                picList: path,
                faterId: faterId,
            },
            success: function (data) {
                if (data.statusCode == 1000) {
                    var $msg = data.data.msgBaseInfo;
                    var $picList = data.data.msgPicList;
                    var $fatherMsg = data.data.fatherMsg;
                    var $fatherPicList = data.data.fatherMsg.picList;
                    var praiseType = "msg";
                    var $html = $(
                        '                        <!--一条帖子上面部分-->\n' +
                        '                        <div class="col-sm-12 col-xs-12 message kjc_msg">\n' +
                        '                            <!--左边头像部分-->\n' +
                        '                            <div class="col-sm-2 col-xs-2">\n' +
                        '                                <a href="javascript:void(0)" onclick="goToUserMainPage(\'' + usertype + '\',\'' + userId + '\')">\n' +
                        '                                    <img src="img/icon.png" class="kjc_msg_face_img" title="' + nickname + '">\n' +
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
                        '                                                <li><a href="javascript:void(0)" title="取消关注东邪西媚">取消关注东邪西媚</a></li>\n' +
                        '                                                <li><a href="javascript:void(0);">举报</a>\n' +
                        '                                                </li>\n' +
                        '                                            </ul>\n' +
                        '                                        </div>\n' +
                        '                                    </div>\n' +
                        '                                </div>\n' +
                        '                                <!--右边的顶上部分-->\n' +
                        '                                <div class="kjc_user_name">\n' +
                        '                    \t\t\t\t\t\t\t\t\t\t<span>\n' +
                        '                                            <a href="javascript:void(0)" class="kjc_msg_a kjc_user_a"onclick="goToUserMainPage(\'' + usertype + '\',\'' + userId + '\')">' + nickname + '</a>\n' +
                        '                                        </span>\n' +
                        '                                </div>\n' +
                        '                                <div class="kjc_msg_info">\n' +
                        '                                    <small class="date">\n' +
                        '                                        <a href="javascript:void(0)" class="kjc_msg_a">' + now + '</a>\n' +
                        '                                    </small>\n' +
                        '                                    <span>来自\n' +
                        '                                        <a href="javascript:void(0)" class="kjc_msg_a" onclick="goToSchoolMainPage(\'' + schoolId + '\')">' + schoolname + '</a>\n' +
                        '                                    </span>\n' +
                        '                                </div>\n' +
                        '                                <!--右边内容部分-->\n' +
                        '                                <div class="msg_content">\n' +
                        '                                    <!--文字内容部分 -->\n' +
                        '                                    <div class="kjc_msg_words">\n' +
                        '                  \t\t\t\t\t\t\t\t\t\t\t<span>' +
                        content +
                        '                             \t\t\t\t\t\t\t\t\t\t\t</span>\n' +
                        '                                    </div>\n' +
                        '                                    <!-- 图片部分-->\n' +
                        '                                    <div class="kjc_msg_img">\n' +
                        '                                        <ul class="col-sm-8 col-xs-12 xiangce" id="xiangce">\n' +

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
                        '                                    <i class="z-num"></i>\n' +
                        '                                </a>\n' +
                        '                            </div>\n' +
                        '                            <div class="col-sm-3 col-xs-3 kjc_message_operation"\n' +
                        '                                 style="border: none">\n' +
                        '                                <a href="javascript:void(0);" class="kjc_msg_operation_a praiseMSG"  onclick="praiseThisMsg(\'' + $msg.id + '\',this,\'' + praiseType + '\')">\n' +
                        '                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;\n' +
                        '                                    <i class="z-num"></i>\n' +
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

                    for (var i = 0; i < img_list_path.length; i++) {
                        var path = img_list_path[i];
                        var li = $(' <li class="col-sm-4 col-xs-4 kjc_msg_img list">\n' +
                            '                                                <img class="mypic" src="' + path + '">\n' +
                            '                                            </li>\n');
                        $($html).find('#xiangce').append(li);
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

                    var $div = $(' <!--一条帖子-->\n' +
                        '                    <div class="row item_msg">\n' +
                        '                    </div>\n' +
                        '                    <!--一条帖子结束-->\n');
                    var $all = $($div).append($html);
                    $("#all").prepend($all);
                    if ('default' == contenttype) {
                        var $div = $(' <!--一条帖子-->\n' +
                            '                    <div class="row item_msg">\n' +
                            '                    </div>\n' +
                            '                    <!--一条帖子结束-->\n');
                        var $my_feelings = $($div).append($html);
                        $("#my_feelings").prepend($my_feelings);
                    } else if ('job' == contenttype) {
                        var $div = $(' <!--一条帖子-->\n' +
                            '                    <div class="row item_msg">\n' +
                            '                    </div>\n' +
                            '                    <!--一条帖子结束-->\n');

                        var $obtain_employment = $($div).append($html);
                        $("#obtain_employment").prepend($obtain_employment);
                    } else if ('club' == contenttype) {
                        var $div = $(' <!--一条帖子-->\n' +
                            '                    <div class="row item_msg">\n' +
                            '                    </div>\n' +
                            '                    <!--一条帖子结束-->\n');
                        var $club = $($div).append($html);
                        $("#club_activity").prepend($club);
                    } else if ('study' == contenttype) {
                        var $div = $(' <!--一条帖子-->\n' +
                            '                    <div class="row item_msg">\n' +
                            '                    </div>\n' +
                            '                    <!--一条帖子结束-->\n');
                        var $study = $($div).append($html);
                        $("#study").prepend($study);
                    }

                    zuley.xiangce({
                        'box': '.xiangce > .list'
                    });
                    $("#content").empty();
                    layer.msg('发布成功');
                    $("#layer_upload .imgAll ul").empty();
                    $("#layer_upload").removeClass("display_block");
                    $("#layer_upload").addClass("display_none");
                } else {
                    layer.msg('发布失败');
                }
            },
            error: function () {
                layer.msg('发布失败');
            }
        });

    });


//添加表情包1
    for (var i = 1; i < 60; i++) {
        $(".emoji_1").append("<img src='img/f" + i + ".png' style='width:35px;height:35px' >");
    }
//添加表情包2
    for (var i = 1; i < 61; i++) {
        $(".emoji_2").append("<img src='img/h" + i + ".png' style='width:35px;height:35px' >");
    }
    $(".emoji").click(function () {
        $(".myEmoji").show();
        //点击空白处隐藏弹出层
        $(document).click(function (e) {
            if (!$("#edit_form").is(e.target) && $("#edit_form").has(e.target).length === 0) {
                $(".myEmoji").hide();
            }
        });
    });
    /*转发中的*/
    $(".transpond_emoji").click(function () {
        $(".transpond_myEmoji").show();
        //点击空白处隐藏弹出层
        $(document).click(function (e) {
            if (!$("#transpond_edit_form").is(e.target) && $("#transpond_edit_form").has(e.target).length === 0) {
                $(".transpond_myEmoji").hide();
            }
        });
    });


//将表情添加到输入框
    $(".myEmoji img").each(function () {
        $(this).click(function () {
            var url = $(this)[0].src;

            $('#content').append("<img src='" + url + "' style='width:25px;height:25px' >");

            $("#send").removeClass("disabled");
        })
    })

    //将表情添加到转发输入框
    $(".transpond_myEmoji img").each(function () {
        $(this).click(function () {
            var url = $(this)[0].src;

            $('#transpond_content').append("<img src='" + url + "' style='width:25px;height:25px' >");

            $("#send").removeClass("disabled");
        })
    })


});

/*上传原创消息的图片*/
function upload_Img() {
    var pathList = '';
    $("#img_form").ajaxSubmit({
        async: false,
        dataType: "json",
        type: "post",
        url: "/bysj/fileUploadController/fileUpload.do",
        success: function (data) {
            console.log(data);
            pathList = data;
        }
    });
    return pathList;
}

/*上传转发消息的图片*/
function upload_transpond_Img() {
    var pathList = '';
    $("#transpond_img_form").ajaxSubmit({
        async: false,
        dataType: "json",
        type: "post",
        url: "/bysj/fileUploadController/fileUpload.do",
        success: function (data) {
            console.log(data);
            pathList = data;
        }
    });
    return pathList;
}


