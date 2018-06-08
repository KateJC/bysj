/*
 *
 * login-register modal
 * Autor: Creative Tim
 * Web-autor: creative.tim
 * Web script: #
 * 
 */
$(function () {
    queryHotMsgList();
});
var boolean = true;

/*显示注册*/
function showRegisterForm() {
    $('.error').removeClass('alert alert-danger').html('');
    $('.login_container').fadeOut('fast', function () {
        $('.login_bar').fadeOut('fast', function () {
            $('.register_bar').fadeIn('fast');
        });
        $('.register_container').fadeIn('fast');
        $('.login-footer').fadeOut('fast', function () {
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('注册');
    });

}

/*显示登录*/
function showLoginForm() {
    $('#loginModal .register_container').fadeOut('fast', function () {
        $('.register_bar').fadeOut('fast', function () {
            $('.login_bar').fadeIn('fast');
        });
        $('.login_container').fadeIn('fast');
        $('.register-footer').fadeOut('fast', function () {
            $('.login-footer').fadeIn('fast');
        });

        $('.modal-title').html('登录');
    });
    $('.error').removeClass('alert alert-danger').html('');
}

/*显示登录*/
function openLoginModal() {
    showLoginForm();
    load_scholl_list();
    setTimeout(function () {
        $('#loginModal').modal('show');
    }, 230);

}

/*显示注册*/
function openRegisterModal() {
    showRegisterForm();
    load_scholl_list();
    setTimeout(function () {
        $('#loginModal').modal('show');
    }, 230);

}

/*加载学校列表*/
function load_scholl_list() {
    if ($('#loginModal .modal-body .kjc_content_container .form-horizontal .school .selectpicker').is('.loaded')) {

    } else {
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/loginAndRegisterController/loadSchollList.do",
            cache: false,
            async: true,
            success: function (data) {
                if (data.statusCode == 1000) {
                    var school_list = data.data;
                    if (school_list != null && school_list.length > 0) {
                        for (var i = 0; i < school_list.length; i++) {
                            var option = $('<option value="' + school_list[i].id + '">' + school_list[i].name + '</option>');
                            $('#loginModal .modal-body .kjc_content_container .form-horizontal .school .selectpicker').append(option);
                        }
                        /*下面这句代码是为了将标签绑定到selectpicker中，这是bootstrap-select 的规则*/
                        $("#loginModal .modal-body .kjc_content_container .form-horizontal .school .selectpicker").selectpicker('refresh');
                        /*防止重复加载*/
                        $('#loginModal .modal-body .kjc_content_container .form-horizontal .school .selectpicker').addClass('loaded')
                    } else {
                        layer.msg('加载学校列表失败');
                    }
                } else {
                    layer.msg('加载学校列表失败');
                }

            }
        });
    }


}

/*获取下拉值*/
function getselectValue(_this, type) {
    // var value = $(_this).find('.selectpicker').attr("value");
    /*var text = $(_this).find('.selectpicker').val();
    var value = $(_this).find('.selectpicker:selected').text();*/
    var text = $(_this).find('.selectpicker option:selected').text();
    var value = $(_this).find('.selectpicker option:selected').val();
    if (if_null(trim(value))) {
        $(_this).prev(".error").addClass('alert alert-danger').html(type + '还没选择 <button type="button" class="close" data-dismiss="error" aria-hidden="true" onclick="close_error(this)">&times;</button>');
        $(_this).addClass("has-error");
        $(_this).find(".dropdown-toggle").addClass("form-control");
        shakeModal();
        boolean = false;
        return "";
    } else {
        boolean = true;
        var results = {"value": value, "text": text};
        return results;
    }
}

/*获取值*/
function getGneralValue(_this, type, If_shakeModal) {
    var value = $(_this).find("input").val();
    if (if_null(trim(value))) {
        if (!if_null(trim(If_shakeModal))) {
            var span = $('<span class="add"  style="color: red; class"> 必填</span>');
            $(_this).addClass('has-error').find('.sign_div').append(span);
        } else {
            $(_this).addClass("has-error").prev(".error").addClass('alert alert-danger').html(type + '不能为空 <button type="button" class="close" data-dismiss="error" aria-hidden="true" onclick="close_error(this)">&times;</button>');
            $(_this).find('input').focus();
            shakeModal();
        }
        boolean = false;
        var results = {"value": "", "flag": boolean};
        return results;
    } else {
        boolean = true;
        var results = {"value": value, "flag": boolean};
        return results;
    }
}

/*添加错误提示*/
function addError(_this, string) {
    $(_this).addClass("has-error").prev(".error").addClass('alert alert-danger').html(string + ' <button type="button" class="close" data-dismiss="error" aria-hidden="true" onclick="close_error(this)">&times;</button>');
    shakeModal();
}

/*登录*/
function loginAjax(_this, e) {
    close_all_error(_this);
    var school_val = '';
    var club = '';
    var user_account = '';
    var user_password = '';
    var user_type = '';
    var form_group = $(_this).parents('.form-horizontal').find('.form-group');
    if (form_group != null && form_group.length > 0) {
        for (var i = 0; i < form_group.length; i++) {
            var that = form_group[i];
            if ($(that).is('.school')) {
                school_val = getselectValue($(that), '学校');
            } else if ($(that).is('.club')) {
                club = getselectValue($(that), '社团');
            } else if ($(that).is('.user_account_div')) {
                user_account = getGneralValue($(that), '账号')["value"];
                if (!checkMobile(user_account)) {
                    addError($(that), '账号应为正确的手机号码！');
                }
            } else if ($(that).is('.user_password_div')) {
                user_password = getGneralValue($(that), '密码')["value"];
                if (getStringLength(user_password) < 8) {
                    addError($(that), '密码长度至少为8位');
                }
            }
        }
    }
    if (boolean) {
        user_type = $('.login_bar').find('.active a').attr('title');
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/loginAndRegisterController/login.do",
            cache: false,
            async: true,
            data: {
                schoolId: school_val['value'],
                phone: user_account,
                password: user_password,
                clubId: club['value'],
                userType: user_type,
            },
            success: function (data) {
                if (data.statusCode == 1000) {
                    myStorage.setItem("userType", user_type);
                    myStorage.setItem('identification', data.data.status);
                    myStorage.setItem("id", data.data.id);
                    myStorage.setItem("phone", data.data.phone);
                    myStorage.setItem("password", data.data.password);
                    myStorage.setItem("school", data.data.schoolname);
                    if (if_null(data.data.status) || !('true' == data.data.status)) {
                        myStorage.setItem("identification", "false");
                        location.href = "/bysj/base/personal_homepage.jsp";
                    } else {
                        myStorage.setItem("nickname", data.data.nickname);
                        myStorage.setItem("identification", "true");
                        if (!if_null(user_type) && 'club' == user_type) {
                            myStorage.setItem("clubname", data.data.club_name);
                            myStorage.setItem('admintype', data.data.admin_type);
                        }
                        layer.msg('登录成功');
                        location.href = "/bysj/base/index.jsp";
                    }
                } else {
                    addError($('.login_container .loginBox'), '账号或密码错误');
                    layer.msg('登录失败');
                }
            },
            error: function () {
                addError($('.login_container .loginBox'), '服务器出错了，稍后再登录');
                layer.msg('登录失败');
            }
        });
    }
}

/*注册*/
function registerAjax(_this, e) {
    close_all_error(_this);
    var schoolId = "";
    var club = "";
    var phone = "";
    var password = "";
    var user_type = "";//用户类型
    var status = "false";//刚刚注册，用户认证状态为false表示还未认证

    var form_group = $(_this).parents('.form-horizontal').find('.form-group');
    if (form_group != null && form_group.length > 0) {
        for (var i = 0; i < form_group.length; i++) {
            var that = form_group[i];
            if ($(that).is('.school')) {
                schoolId = getselectValue($(that), '学校');
            } else if ($(that).is('.club')) {
                club = getGneralValue($(that), '社团');
            } else if ($(that).is('.user_account_div')) {
                phone = getGneralValue($(that), '账号')["value"];
                if (!checkMobile(phone)) {
                    addError($(that), '账号应为正确的手机号码！');
                }
            } else if ($(that).is('.user_password_div')) {
                password = getGneralValue($(that), '密码')["value"];
                if (getStringLength(password) < 8) {
                    addError($(that), '密码长度至少为8位');
                }
            }
        }
        if (boolean) {
            user_type = $('.register_bar').find('.active a').attr('title');
            $.ajax({
                type: "post",
                dataType: "json",
                url: "/bysj/loginAndRegisterController/register.do",
                cache: false,
                async: true,
                data: {
                    schoolId: schoolId["value"],
                    clubName: club["value"],
                    phone: phone,
                    password: password,
                    user_type: user_type,
                    status: status,
                },
                success: function (data) {
                    if (data.statusCode == 1000) {
                        if (!data.flag) {
                            $(_this).parents(".form").prev().addClass('alert alert-danger').html(data.statusMsg + ' <button type="button" class="close" data-dismiss="error" aria-hidden="true" onclick="close_error(this)">&times;</button>');
                            shakeModal();
                        } else {
                            myStorage.setItem("identification", status);
                            myStorage.setItem("userType", user_type);
                            /* myStorage.setItem("id", data.data.id);
                             myStorage.setItem("phone", data.data.phone);
                             myStorage.setItem("school_id", shcoolId["value"]);
                             myStorage.setItem("school_name", shcoolId["text"]);
                             myStorage.setItem("user_type", user_type);
                             myStorage.setItem("password", password);*/
                            location.href = "/bysj/base/personal_homepage.jsp"
                        }
                    } else {
                        $(_this).parents(".form").prev().addClass('alert alert-danger').html(data.statusMsg + ' <button type="button" class="close" data-dismiss="error" aria-hidden="true" onclick="close_error(this)">&times;</button>');
                        shakeModal();
                    }
                }
            });
            // $('#aa').attr('action', '/bysj/loginAndRegisterController/test.do').submit();
        }

    }
}

/*抖动*/
function shakeModal() {
    $('#loginModal .modal-dialog').addClass('shake');
    // $('.error').addClass('alert alert-danger').html('输入的账号或密码不正确 <button type="button" class="close" data-dismiss="error" aria-hidden="true" onclick="close_error(this)">&times;</button>');
    // $('input[type="password"]').val('');
    setTimeout(function () {
        $('#loginModal .modal-dialog').removeClass('shake');
    }, 1000);
}

/*清楚错误信息*/
function close_error(_this) {
    $(_this).parents(".error").removeClass('alert alert-danger').html('');

}

/*清除所有错误信息*/
function close_all_error(_this) {
    $(_this).parents(".form-horizontal").find(".error").removeClass('alert alert-danger').html('');
}

/*获取下拉列框学校选中的值加载社团*/
var loasClub = function (_this) {
    var school_val = getselectValue($('#organization_of_school .form-horizontal .school'), '学校');
    var schoolId = school_val['value'];
    $('#loginModal .modal-body .kjc_content_container .form-horizontal .club .selectpicker').empty();
    $('#loginModal .modal-body .kjc_content_container .form-horizontal .club .selectpicker').append('<option value="">请选择社团</option>');

    $.ajax({
        type: "post",
        dataType: "json",
        url: "/bysj/loginAndRegisterController/loadClubList.do",
        cache: false,
        async: true,
        data: {
            schoolId: schoolId,
        },
        success: function (data) {
            if (data.statusCode == 1000) {
                var clubList = data.data;
                if (clubList != null && clubList.length > 0) {
                    for (var i = 0; i < clubList.length; i++) {
                        var option = $('<option value="' + clubList[i].id + '">' + clubList[i].club_name + '</option>');
                        $('#loginModal .modal-body .kjc_content_container .form-horizontal .club .selectpicker').append(option);
                    }
                    /*下面这句代码是为了将标签绑定到selectpicker中，这是bootstrap-select 的规则*/
                    $("#loginModal .modal-body .kjc_content_container .form-horizontal .club .selectpicker").selectpicker('refresh');
                    /*防止重复加载*/
                    $('#loginModal .modal-body .kjc_content_container .form-horizontal .club .selectpicker').addClass('loaded')
                } else {
                    layer.msg('该学校暂无注册社团');
                }
            } else {
                layer.msg('加载社团列表失败');
            }

        }
    });

};




