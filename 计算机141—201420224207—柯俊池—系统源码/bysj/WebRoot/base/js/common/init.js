/*加载用户基本信息*/
var initUserInfo = function () {
    var $data = '';
    $.ajax({
        type: "post",
        dataType: "json",
        url: "/bysj/loginAndRegisterController/init.do",
        cache: true,
        async: false,
        success: function (data) {
            if (data.statusCode == 1000) {
                $data = data.data;
                if (!if_null($data)) {
                    myStorage.setItem("id", $data.id);
                    myStorage.setItem("userType", $data.userType);
                    myStorage.setItem("phone", data.data.phone);
                    myStorage.setItem("password", data.data.password);
                    myStorage.setItem("schoolname", data.data.schoolname);
                    myStorage.setItem("schoolId", data.data.school_id);
                    if (!if_null($data.userType) && 'club' == $data.userType) {
                        myStorage.setItem("clubname", data.data.club_name);
                        myStorage.setItem('admintype', data.data.admin_type);
                    }
                    if (if_null(data.data.nickname)) {
                        $('#user_id span').html(data.data.phone);
                        $('.User_Account_Img span').html(data.data.phone);
                    } else {
                        myStorage.setItem("nickname", data.data.nickname);
                        $('#user_id span').html(data.data.nickname);
                        $('.User_Account_Img span').html(data.data.nickname);

                    }
                    if (!if_null(data.data.account_picture)) {
                        $('.User_Account_Img img').attr("src", data.data.account_picture);
                    }
                    $('#user_id span').attr("value", data.data.id);
                } else {
                    location.href = "/bysj/base/login_or_register/no_account_index.jsp";
                }

            }
        }
    });
    return {"data": $data};
};