$(function () {

    initUserInfo();
    loadMsgList();
    count();

    <!--点赞帖子-->
    /* $('.kjc_content_container').on('click', '.message_bottom .praiseMSG', function () {

     });*/
    $('#kjc_item_sort').on('click', '.list-group-item', function () {
        $(this).siblings('a').removeClass("active");
        $(this).addClass("active");
    });
});


/*加载该用户相互关注的用户所发的帖子*/
var querymyfriendMsgList = function ($this) {
    var $that = $this;
    var pageSize = 15;
    var currentPage = 1;
    var totalpage = 1;
    if (!if_null($that)) {
        pageSize = $($this).find(".pageSize").attr("value");
        currentPage = parseInt($($this).find(".currentPage").attr("value")) + 1;
        totalpage = $($this).find(".total").attr("value");
    }
    if (totalpage < currentPage) {
        layer.msg('已经是最后了');
        return;
    } else {
        if (!if_null($that)) {
            $($this).find(".currentPage").attr("value", currentPage);
        }
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/msgController/querymyfriendMsgList.do",
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
                    $("#page").find(".total").attr("value", data.data.totalPage);
                    var resultsList = data.data.resultsList;
                    var activeUserId = myStorage.getItem("id");
                    var activeUserType = myStorage.getItem("userType");
                    if (resultsList.length > 0) {
                        for (var i = 0; i < resultsList.length; i++) {
                            var $msg = resultsList[i];
                            if (!if_null($msg.transpondMsgId)) {
                                transpondmsg($msg);
                            } else {
                                original($msg);
                            }


                        }
                    } else {
                        layer.msg('该分组没有消息哦，先去发布消息')
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
/*加载用户首页帖子*/
var loadMsgList = function ($this) {
    if (!$("#page").is(".default")) {
        $("#page").removeClass("myFriend").removeClass("hot").removeClass("school").addClass("default");
    }
    var $that = $this;
    var pageSize = 15;
    var currentPage = 1;
    var totalpage = 1;
    if (!if_null($that)) {
        pageSize = $($this).find(".pageSize").attr("value");
        currentPage = parseInt($($this).find(".currentPage").attr("value")) + 1;
        totalpage = $($this).find(".total").attr("value");
    }
    if (totalpage < currentPage) {
        layer.msg('已经是最后了');
        return;
    } else {
        if (!if_null($that)) {
            $($this).find(".currentPage").attr("value", currentPage);
        }
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/msgController/queryIndexPageMsgList.do",
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
                    $("#page").find(".total").attr("value", data.data.totalPage);
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
    }
};
/*加载与该用户同一个学校的其他用户发的帖子*/
var querymySchoolMsgList = function ($this) {
    var $that = $this;
    var pageSize = 15;
    var currentPage = 1;
    var totalpage = 1;
    if (!if_null($that)) {
        pageSize = $($this).find(".pageSize").attr("value");
        currentPage = parseInt($($this).find(".currentPage").attr("value")) + 1;
        totalpage = $($this).find(".total").attr("value");
    }
    if (totalpage < currentPage) {
        layer.msg('已经是最后了');
        return;
    } else {
        if (!if_null($that)) {
            $($this).find(".currentPage").attr("value", currentPage);
        }
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/bysj/msgController/querymySchoolMsgList.do",
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
                    $("#page").find(".total").attr("value", data.data.totalPage);
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
/*加载该用户点赞过的帖子*/
var queryMyPraiseMsgList = function ($this) {
    $.ajax({
        type: "post",
        dataType: "json",
        url: "/bysj/msgController/queryMyPraiseMsgList.do",
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
                var resultsList = data.data;
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



var nextPage = function ($this) {
    var $that = $this;
    var $thatparents = $($this).parents(".pageDiv");

    if ($($thatparents).is(".default")) {
        loadMsgList($thatparents);
    } else if ($($thatparents).is(".hot")) {
        queryHotMsgList($that);
    } else if ($($thatparents).is(".school")) {
        querymySchoolMsgList($thatparents)
    } else if ($($thatparents).is(".myFriend")) {
        querymyfriendMsgList($thatparents);
    }
};

var gotoquerymyfriendMsgList = function () {
    if (!$("#page").is(".myFriend")) {
        $("#page").removeClass("default").removeClass("hot").removeClass("school").addClass("myFriend");
    }
    $("#page").find(".pageSize").attr("value", "15");
    $("#page").find(".currentPage").attr("value", 0);
    $("#page").find(".total").attr("value", 1);

    $("#all").empty();
    $("#my_feelings").empty();
    $("#study").empty();
    $("#club_activity").empty();
    $("#obtain_employment").empty();
    nextPage($("#page a"));
};

var gotoquerymySchoolMsgList = function () {
    if (!$("#page").is(".school")) {
        $("#page").removeClass("default").removeClass("hot").removeClass("myFriend").addClass("school");
    }

    $("#page").find(".pageSize").attr("value", "15");
    $("#page").find(".currentPage").attr("value", 0);
    $("#page").find(".total").attr("value", 1);

    $("#all").empty();
    $("#my_feelings").empty();
    $("#study").empty();
    $("#club_activity").empty();
    $("#obtain_employment").empty();
    nextPage($("#page a"));
};

var gotoqueryHotMsgList = function () {
    if (!$("#page").is(".hot")) {
        $("#page").removeClass("default").removeClass("school").removeClass("myFriend").addClass("hot");
    }
    $("#page").find(".pageSize").attr("value", "15");
    $("#page").find(".currentPage").attr("value", 0);
    $("#page").find(".total").attr("value", 1);

    $("#all").empty();
    $("#my_feelings").empty();
    $("#study").empty();
    $("#club_activity").empty();
    $("#obtain_employment").empty();
    nextPage($("#page a"));
};