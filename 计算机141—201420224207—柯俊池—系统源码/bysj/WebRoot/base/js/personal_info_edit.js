/*在个人主页浏览历史图片的操作js*/
var userInfo = "";
$(function () {
    /*初始化*/
    initPage();
    /*检测是否身份验证*/
    if ("false" == myStorage.getItem("identification")) {
        layer.msg("您帐号还没认证，请完善个人信息");
        identification();
    }
    /*这种方式不行*/
    /* $('#my_photo_album').on("click", ".img_good", function (e) {
         e.stopPropagation();//阻止冒泡，意思就是当点击上层元素事件，执行完之后，不会继续执行下层元素的事件
         if ($(this).find("span").is(".good_red")) {
             $(this).find("span").removeClass('good_red')
         } else {
             $(this).find("span").addClass("good_red");
         }
     });*/
    /*这种方式行*/
    /*  $('.img_good').click(function (e) {
          e.stopPropagation();//阻止冒泡，意思就是当点击上层元素事件，执行完之后，不会继续执行下层元素的事件
          if ($(this).find("span").is(".good_red")) {
              $(this).find("span").removeClass('good_red')
          } else {
              $(this).find("span").addClass("good_red");
          }
      });*/
    loadMyMsgList();
    count();
});

var loadMyMsgList = function ($this) {
    $.ajax({
        type: "post",
        dataType: "json",
        url: "/bysj/msgController/loadMyMsgList.do",
        cache: false,
        async: true,
        data: {},
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
        },
        error: function () {
            layer.msg('操作失败');
        }
    });
};


var updateHead = function () {
    var path = uploadHeardPic;
    $.ajax({
        type: "post",
        dataType: "json",
        url: "/bysj/msgController/updateHead.do",
        cache: false,
        async: true,
        data: {
            path: path,
        },
        success: function (data) {
            if (data.statusCode == 1000) {
                $(".User_Account_Img img").attr("src", path());
                layer.msg('操作成功');
            }
        },
        error: function () {
            layer.msg('操作失败');
        }
    });


};
/*这种方式行 点赞图片*/
var good = function (_this, e) {
    e.stopPropagation();//阻止冒泡，意思就是当点击上层元素事件，执行完之后，不会继续执行下层元素的事件
    if ($(_this).find("span").is(".good_red")) {
        $(_this).find("span").removeClass('good_red')
    } else {
        $(_this).find("span").addClass("good_red");
    }
};
/*初始化页面用户信息*/
var initPage = function () {
    userInfo = initUserInfo()["data"];
    showUserBriefInfo();
};
/*展示用户的简要信息*/
var showUserBriefInfo = function () {
    var user_type = myStorage.getItem("userType");
    var id = myStorage.getItem("id");
    var phone = myStorage.getItem("phone");
    if (userInfo.status == 'true' || 'true' == myStorage.getItem("identification")) {
        $('.personal_info .identification .is_Validate').html("已经验证");
    } else {
        $('.personal_info .identification .is_Validate').html("还未验证");
    }

    $('.personal_info .brief ul').remove();
    if ('student' == user_type) {
        var my_li = $('<ul class="none_padding">' + ' <li class="personal_info_li phone">\n' +
            '                                    <span class="personal_info_item">登录名：</span><span class="text"></span></a>\n' +
            '                                </li>\n' +
            '                                <li class="personal_info_li nickname"><span\n' +
            '                                        class="personal_info_item">昵称：</span><span class="text"></span></li>\n' +
            '                                <li class="personal_info_li realName"><span\n' +
            '                                        class="personal_info_item">真实姓名：</span><span class="text"></span></li>\n' +
            '                                <li class="personal_info_li school"><span\n' +
            '                                        class="personal_info_item">就读学校：</span><span class="text"></span></li>\n' +
            '                                <li class="personal_info_li student_major"><span\n' +
            '                                        class="personal_info_item">专业:</span><span class="text"> </span>\n' +
            '                                </li>\n' +
            '                                <li class="personal_info_li student_class"><span\n' +
            '                                        class="personal_info_item">班级：</span><span class="text"></span>\n' +
            '                                </li>\n' +
            '                                <li class="personal_info_li phone"><span\n' +
            '                                        class="personal_info_item">联系号码:</span><span class="text"></span></li>' + ' </ul>');
        $(my_li).find('.phone .text').html(if_null(userInfo.phone) ? "" : userInfo.phone);
        $(my_li).find('.nickname .text').html(if_null(userInfo.nickname) ? "" : userInfo.nickname);
        $(my_li).find('.realName .text').html(if_null(userInfo.real_name) ? "" : userInfo.real_name);
        $(my_li).find('.school .text').html(if_null(userInfo.schoolname) ? "" : userInfo.schoolname);
        $(my_li).find('.student_major .text').html(if_null(userInfo.student_major) ? "" : userInfo.student_major);
        $(my_li).find('.student_class .text').html(if_null(userInfo.student_class) ? "" : userInfo.student_class);
        $('.personal_info .brief').append(my_li);

    }
    else if ('school' == user_type) {
        var my_li = $('<ul class="none_padding">' + '<li class="personal_info_li phone">\n' +
            '                                    <span class="personal_info_item">登录名：</span><span class="text"></span></li>\n' +
            '                                <li class="personal_info_li nickname"><span\n' +
            '                                        class="personal_info_item">昵称：</span><span class="text"></span></li>\n' +
            '                                <li class="personal_info_li school"><span\n' +
            '                                        class="personal_info_item">学校：</span><span class="text"></span></li>\n' +
            '                                <li class="personal_info_li admin_type"><span\n' +
            '                                        class="personal_info_item">身份：</span><span class="text"></span></li>\n' +
            '                                <li class="personal_info_li phone"><span\n' +
            '                                        class="personal_info_item">联系号码:</span><span class="text"></span></li>' + ' </ul>');

        $(my_li).find('.phone .text').html(if_null(userInfo.phone) ? "" : userInfo.phone);
        $(my_li).find('.nickname .text').html(if_null(userInfo.nickname) ? "" : userInfo.nickname);
        $(my_li).find('.school .text').html(if_null(userInfo.schoolname) ? "" : userInfo.schoolname);
        $(my_li).find('.admin_type .text').html(('super' == if_null(userInfo.admin_type) ? "" : userInfo.admin_type) ? "超级管理员" : "普通管理员");
        $('.personal_info .brief').append(my_li);
    }
    else if ('club' == user_type) {
        var my_li = $('<ul class="none_padding">' + '<li class="personal_info_li clubName">\n' +
            '                                    <span class="personal_info_item">社团名称：</span><span class="text"></span></li>\n' +
            '                                <li class="personal_info_li phone">\n' +
            '                                    <span class="personal_info_item">登录名：</span><span class="text"></span></li>\n' +
            '                                <li class="personal_info_li nickname"><span\n' +
            '                                        class="personal_info_item">昵称：</span><span class="text"></span></li>\n' +
            '                                <li class="personal_info_li school"><span\n' +
            '                                        class="personal_info_item">学校：</span><span class="text"></span></li>\n' +
            '                                <li class="personal_info_li adminType"><span\n' +
            '                                        class="personal_info_item">身份：</span><span class="text"></span></li>\n' +
            '                                <li class="personal_info_li phone"><span\n' +
            '                                        class="personal_info_item">联系号码:</span><span class="text"></span></li>' + ' </ul>');

        $(my_li).find('.phone .text').html(if_null(userInfo.phone) ? "" : userInfo.phone);
        $(my_li).find('.nickname .text').html(if_null(userInfo.nickname) ? "" : userInfo.nickname);
        $(my_li).find('.school .text').html(if_null(userInfo.schoolname) ? "" : userInfo.schoolname);
        $(my_li).find('.adminType .text').html(('super' == if_null(userInfo.admin_type) ? "" : userInfo.admin_type) ? "超级管理员" : "普通管理员");
        $(my_li).find('.clubName .text').html(if_null(userInfo.club_name) ? "" : userInfo.club_name);
        $('.personal_info .brief').append(my_li);
    }

};

/*保存或更新个人信息*/
var saveOrUpdate_User_info = function (_this) {
    var id = '';
    var phone = '';
    var password = '';
    var nickname = '';
    var realName = '';
    var identity_card = '';
    var student_major = '';
    var student_number = '';
    var student_class = '';
    var brief_introduction = '';
    var club_name = '';
    var user_type = myStorage.getItem("userType");
    var form_group = $(_this).parents('.personal_info_edit').find('#personal_info .form-group');
    if (form_group != null && form_group.length > 0) {
        for (var i = 0; i < form_group.length; i++) {
            var that = form_group[i];
            $(that).removeClass('has-error').find('.sign_div .add').remove();
            if ($(that).is('.id')) {
                id = getGneralValue($(that), 'id', 'no_shakeModal');

            }
            else if ($(that).is('.phone')) {
                phone = getGneralValue($(that), '账号', 'no_shakeModal');
                if (!checkMobile(phone["value"])) {
                    addError($(that), '账号应为正确的手机号码！', 'no_shakeModal');
                }
            } else if ($(that).is('.password')) {
                password = getGneralValue($(that), '密码', 'no_shakeModal');
                if (getStringLength(password["value"]) < 8) {
                    addError($(that), '密码长度至少为8位');
                }
            } else if ($(that).is('.nickname')) {
                nickname = getGneralValue($(that), '昵称', 'no_shakeModal');
            } else if ($(that).is('.realName')) {
                realName = getGneralValue($(that), '真实姓名', 'no_shakeModal');
            } else if ($(that).is('.identity_card')) {
                identity_card = getGneralValue($(that), '身份证号码', 'no_shakeModal');
                if (!validateIdentityCard(identity_card["value"])) {
                    addErrorSign(that, '请输入合法的身份证号码')
                }
            } else if ($(that).is('.student_number')) {
                student_number = getGneralValue($(that), '学号', 'no_shakeModal');
            } else if ($(that).is('.student_major')) {
                student_major = getGneralValue($(that), '专业', 'no_shakeModal');
            } else if ($(that).is('.student_class')) {
                student_class = getGneralValue($(that), '班级', 'no_shakeModal');
            }
            else if ($(that).is('.club_name')) {
                club_name = getGneralValue($(that), '社团名', 'no_shakeModal');
            }
            else if ($(that).is('.brief_introduction')) {
                brief_introduction = getGneralValue($(that), '简介', 'no_shakeModal');
            }
        }
    }
    $.ajax({
        type: "post",
        dataType: "json",
        url: "/bysj/loginAndRegisterController/updateUserInfo.do",
        cache: false,
        async: true,
        data: {
            id: id["value"],
            phone: phone["value"],
            password: password["value"],
            nickname: nickname["value"],
            realName: realName["value"],
            identityCard: identity_card["value"],
            studentMajor: student_major["value"],
            studentNumber: student_number["value"],
            studentClass: student_class["value"],
            clubName: club_name["value"],
            briefIntroduction: brief_introduction["value"],
            userType: user_type,
        },
        success: function (data) {
            if (data.statusCode == 1000) {
                myStorage.setItem('identification', 'true');
                myStorage.setItem("id", data.data.id);
                myStorage.setItem("userType", data.data.userType);
                myStorage.setItem("phone", data.data.phone);
                myStorage.setItem("password", data.data.password);
                myStorage.setItem("nickname", data.data.nickname);
                initPage();
                layer.msg('保存成功');

            } else {
                layer.msg('保存失败');
            }
        }
    });


};
/*添加错误提示*/
var addErrorSign = function (_this, value) {
    var sign = $('<span class="add"  style="color: red;">' + value + '</span>');
    $(_this).find('.sign_div').append(sign);
};
/*对新注册用户的身份补充认证*/
var identification = function () {
    personal_Info_Edit($('#edit_operation'));
};
/*填充用户编辑信息*/
var showUserEditInfo = function () {
    var user_type = myStorage.getItem("userType");

    $('#personal_info .id input').val(if_null(userInfo.id) ? "" : userInfo.id);
    $('#personal_info .phone input').val(if_null(userInfo.phone) ? "" : userInfo.phone);
    $('#personal_info .school_id input').attr('value', if_null(userInfo.school_id) ? "" : userInfo.school_id);
    $('#personal_info .school_id input').val(if_null(userInfo.schoolname) ? "" : userInfo.schoolname);
    $('#personal_info .password input').val(if_null(userInfo.password) ? "" : userInfo.password);
    $('#personal_info .nickname input').val(if_null(userInfo.nickname) ? "" : userInfo.nickname);

    if ("school" == user_type) {
        $('#personal_info .form-horizontal').find('.club_type').remove();
        $('#personal_info .form-horizontal').find('.student_type').remove();

        $('#personal_info .admin_type input').val(('super' == if_null(userInfo.admin_type) ? "" : userInfo.admin_type) ? "超级管理员" : "普通管理员");
        $('#personal_info .brief_introduction input').val(if_null(userInfo.briefIntroduction) ? "" : userInfo.briefIntroduction);
    }
    if ("club" == user_type) {
        $('#personal_info .form-horizontal').find('.student_type').remove();

        $('#personal_info .admin_type input').val(('super' == if_null(userInfo.admin_type) ? "" : userInfo.admin_type) ? "超级管理员" : "普通管理员");
        $('#personal_info .club_name input').val(if_null(userInfo.club_name) ? "" : userInfo.club_name);
        $('#personal_info .brief_introduction input').val(if_null(userInfo.brief_introduction) ? "" : userInfo.brief_introduction);
    }
    if ('student' == user_type) {
        $('#personal_info .form-horizontal').find('.school_type').remove();
        $('#personal_info .form-horizontal').find('.club_type').remove();


        $('#personal_info .realName input').val(if_null(userInfo.real_name) ? "" : userInfo.real_name);
        $('#personal_info .identity_card input').val(if_null(userInfo.identity_card) ? "" : userInfo.identity_card);
        $('#personal_info .student_number input').val(if_null(userInfo.student_number) ? "" : userInfo.student_number);
        $('#personal_info .student_major input').val(if_null(userInfo.student_major) ? "" : userInfo.student_major);
        $('#personal_info .student_class input').val(if_null(userInfo.student_class) ? "" : userInfo.student_class);
    }


};
/*显示编辑个人信息*/
var personal_Info_Edit = function (_this) {
    /*判断是否已经在显示，若已经在显示就隐藏，否则显示*/
    if ($(_this).is('.editting')) {
        $('.myhomepage_bottom-right .personal_info_edit').removeClass('in active');
        $('.myhomepage_bottom-right .personal_info_edit').fadeOut('fast', function () {
            $('.myhomepage_bottom-right .kjc_content_container').fadeIn('fast');
            $('.myhomepage_bottom-right .navigation_bar').fadeIn('fast');
            $(_this).removeClass('editting');
        });
    } else {
        $('.myhomepage_bottom-right .navigation_bar').fadeOut('fast', function () {
            $('.myhomepage_bottom-right .kjc_content_container').fadeOut('fast', function () {
                $('.myhomepage_bottom-right .personal_info_edit').fadeIn('fast');
                $('.myhomepage_bottom-right .personal_info_edit').addClass('in active');
                $(_this).addClass('editting');
                showUserEditInfo();
            });
        });
    }

};

/*我的个人主页*/
var show_persional_homePage = function () {
    /*判断分类显示容器收否被隐藏了，若已经被隐藏，则显示。若不被隐藏，则不处理*/
    if ($('.Navigation_bar_classification').is('.fade_out')) {
        $('#follow_fans').removeClass('in active');
        $('.follow_fans').fadeOut('fast', function () {
            $('.Navigation_bar_classification').fadeIn('fast', function () {
                $('.navigation_bar_classification').removeClass('fade_out');
            });

        });
    }
    /*判断在之前是否已经跳转到个人信息编辑，若是，则将个人信息编辑隐藏，否则不做处理*/
    if ($('.edit_operation').is('.editting')) {
        $('.myhomepage_bottom-right .personal_info_edit').removeClass('in active');
        $('.myhomepage_bottom-right .personal_info_edit').fadeOut('fast', function () {
            $('.myhomepage_bottom-right .kjc_content_container').fadeIn('fast');
            $('.myhomepage_bottom-right .navigation_bar').fadeIn('fast');
            $('.edit_operation').removeClass('editting');
        });
    }
};
/*跳转关注粉丝*/
var go_to_follow = function (_this, e) {
    $('.Navigation_bar_classification').fadeOut('fast', function () {
        $('.Navigation_bar_classification').addClass('fade_out');
        $('.follow_fans').fadeIn('fast');
        $('#follow_fans').addClass('in active');
    });
};


/*上传转发消息的图片*/
function uploadHeardPic() {
    var pathList = '';
    $("#updateHeadForm").ajaxSubmit({
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

var updateHeadPicClick = function () {
    if ($("#updateHeadPic_layer_upload").is(".display_block")) {
        $("#updateHeadPic_layer_upload").removeClass("display_block");
        $("#updateHeadPic_layer_upload").addClass("display_none");
    } else {
        $("#updateHeadPic_layer_upload").addClass("display_block");
        $("#updateHeadPic_layer_upload").removeClass("display_none");
    }

};