<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="format-detection" content="telephone=no"/>
    <title>我的赞过得微校</title>
    <link rel="stylesheet" href="/bysj/jar/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/bysj/base/css/style.css">
    <link rel="stylesheet" type="text/css" href="/bysj/jar/js/bootstrap-select-1.12.4/dist/css/bootstrap-select.css">
    <link rel="stylesheet" type="text/css" href="/bysj/base/css/navigation_bar.css">
    <link rel="stylesheet" type="text/css" href="/bysj/base/css/show_img.css">
    <link rel="stylesheet" href="/bysj/base/css/comment_style.css">
    <link rel="stylesheet" href="/bysj/base/css/comment.css">
</head>
<body>
<nav class="navbar  navbar-fixed-top" role="navigation" style="background: #e0620d ;padding-top: 3px;height:50px;">
    <div class="container-fluid" style="background: #fff;">
        <div class="navbar-header ">
            <span class="navbar-brand" href="#">大学微校</span>

            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#my-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <input type="text" class="form-control kjc_search" placeholder="#热门话题#">
                <i class="glyphicon glyphicon-search btn_search"></i>
                <!--  <button type="submit" class="btn btn-default">提交</button> -->
            </div>

        </form>

        <div class="collapse navbar-collapse" id="my-navbar-collapse">

            <ul class="nav navbar-nav navbar-right">
                <li><a href="/bysj/base/index.jsp"><i
                        class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;<strong>首页</strong></a></li>
                <li><a href="#"><i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;<strong>私信</strong>&nbsp;<span
                        class="badge">99+</span></a></li>
                <li id="user_id"><a href="#"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;<span></span></a></li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        设置 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">登录</a></li>
                        <li><a href="#">注册</a></li>

                    </ul>
                </li>
            </ul>

        </div>


    </div>
    <hr style="margin: 0;padding: 0;color:#222;width: 100%">
</nav>

<div class="container container_bg">
    <div class="row">
        <div class="col-sm-2 col-xs-12 kjc_item">
            <div class="list-group kjc_item_sort">
                <a href="/bysj/base/index.jsp" class="list-group-item active"><span
                        class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;首页</a>
                <a href="#" class="list-group-item"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;我的赞</a>
                <a href="#" class="list-group-item"><span class="glyphicon glyphicon-star"></span>&nbsp;&nbsp;我的收藏</a>
                <a href="#" class="list-group-item"><span class="glyphicon glyphicon-globe"></span>&nbsp;&nbsp;热门</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;好友圈</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;本校圈</a>
            </div>
            <div class="kjc_friends_group kjc_group_primary row pre-scrollable">
                <a href="#" class="list-group-item">&nbsp;&nbsp;特别关注</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;媒体</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;高校</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;就业</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
                <a href="#" class="list-group-item">&nbsp;&nbsp;计算机141</a>
            </div>
        </div>


        <!--中间-->
        <div class="col-sm-7 col-xs-12 my_edit">
            <div class="row praise_bar">
                <div class="pull-left" style="color: #000;padding-left: 15px;padding-top: 8px;font-size: 15px;"><span
                        class="glyphicon glyphicon-tags"></span>&nbsp;
                    <span>我赞过的微校</span></div>
                <form class="navbar-form col-sm-3 pull-right" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="#搜索我赞过的微校#">
                        <i class="glyphicon glyphicon-search btn_search"></i>
                        <!--  <button type="submit" class="btn btn-default">提交</button> -->
                    </div>
                </form>
            </div>


            <!--信息容器-->
            <div class="tab-content kjc_content_container">

                <!--“全部”分类对应的信息容器-->
                <div class="tab-pane fade in active" id="all">

                    <!--一条帖子-->
                    <div class="row item_msg">
                        <!--一条帖子上面部分-->
                        <div class="col-sm-12 col-xs-12 message kjc_msg">
                            <!--左边头像部分-->
                            <div class="col-sm-2 col-xs-2">
                                <a href="#" title="Jack.C">
                                    <img src="img/icon.png" class="kjc_msg_face_img" style="border-radius: 50%"
                                         title="Jack.C">
                                </a>
                            </div>
                            <!-- 右边内容部分-->
                            <div class="col-sm-10 col-xs-10 kjc_msg_content">
                                <!--右边的顶上部分-->
                                <div class="kjc_user_name"> <span style="font-weight: bold;">
                                    <a href="#" class="kjc_msg_a kjc_user_a">Jack.C</a></span>
                                </div>
                                <div class="kjc_msg_info">
                                    <small class="date" style="color:#999"><a href="#" class="kjc_msg_a">1分钟前</a>
                                    </small>
                                    <span style="color:#999">来自<a href="#" class="kjc_msg_a">仲恺农业工程学院</a></span>
                                </div>
                                <!--右边内容部分-->
                                <div class="msg_content">
                                    <!--文字内容部分 -->
                                    <div class="kjc_msg_words"><span>happy day!<br>
                                        这里有很多文字<br>
                                    超级多<br>
                                    非非常多</span>
                                    </div>
                                    <!-- 图片部分-->
                                    <div class="kjc_msg_img">
                                        <ul class="col-sm-8 col-xs-12 xiangce">
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--一条帖子的底部操作栏-->
                        <div class="col-sm-12 col-xs-12 message_bottom">
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-star-empty"></span>&nbsp;&nbsp;收藏&nbsp;
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-share"></span>&nbsp;&nbsp;转发&nbsp;
                                    <span class="badge">548</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a class="kjc_msg_operation_a kjc_pl_btn">
                                    <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;评论&nbsp;
                                    <span class="badge">9959</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation" style="border: none">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;
                                    <span class="badge">9954</span>
                                </a></div>
                        </div>

                        <!--一条帖子的评论部分 默认为隐藏起来-->
                        <div class="commentAll col-sm-12 col-xs-12">
                            <!--评论区域 begin-->
                            <div class="reviewArea clearfix">
                                <textarea class="content comment-input" placeholder="请输入您的评论，不超过140个字符&hellip;"
                                          onkeyup="keyUP(this)"></textarea>
                                <a href="javascript:;" class="plBtn">评论</a>
                            </div>
                            <!--评论区域 end-->
                            <!--回复区域 begin-->
                            <div class="comment-show">
                                <div class="comment-show-con clearfix">
                                    <!--评论中的头像-->
                                    <div class="comment-show-con-img pull-left"><a href="#" title="张三"><img
                                            src="images/header-img-comment_03.png" alt="" title="张三"></a></div>
                                    <!--评论右边部分-->
                                    <div class="comment-show-con-list pull-left clearfix">
                                        <!--上部分用户名和评论内容-->
                                        <div class="pl-text clearfix">
                                            <a href="#" class="comment-size-name">张三 : </a><!--用户名-->
                                            <span class="my-pl-con">&nbsp;来啊 造作啊!</span><!--评论内容-->
                                        </div>
                                        <!--下面部分时间和操作部分-->
                                        <div class="date-dz">
                                            <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                            <div class="date-dz-right pull-right comment-pl-block">
                                                <a href="javascript:;" class="removeBlock">删除</a>
                                                <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                <span class="pull-left date-dz-line">|</span>
                                                <a href="javascript:;" class="date-dz-z pull-left">
                                                    <i class="date-dz-z-click-red"></i>赞 (
                                                    <i class="z-num">666</i>)</a>
                                            </div>
                                        </div>
                                        <div class="hf-list-con"></div>
                                    </div>
                                </div>
                            </div>
                            <!--回复区域 end-->
                        </div>


                    </div>
                    <!--一条帖子结束-->


                    <!--一条帖子-->
                    <div class="row item_msg">
                        <!--一条帖子上面部分-->
                        <div class="col-sm-12 col-xs-12 message kjc_msg">
                            <!--左边头像部分-->
                            <div class="col-sm-2 col-xs-2">
                                <a href="#" title="Jack.C">
                                    <img src="img/icon.png" class="kjc_msg_face_img" style="border-radius: 50%"
                                         title="Jack.C">
                                </a>
                            </div>
                            <!-- 右边内容部分-->
                            <div class="col-sm-10 col-xs-10 kjc_msg_content">
                                <!--右边的顶上部分-->
                                <div class="kjc_user_name"> <span style="font-weight: bold;">
                                    <a href="#" class="kjc_msg_a kjc_user_a">Jack.C</a></span>
                                </div>
                                <div class="kjc_msg_info">
                                    <small class="date" style="color:#999"><a href="#" class="kjc_msg_a">1分钟前</a>
                                    </small>
                                    <span style="color:#999">来自<a href="#" class="kjc_msg_a">仲恺农业工程学院</a></span>
                                </div>
                                <!--右边内容部分-->
                                <div class="msg_content">
                                    <!--文字内容部分 -->
                                    <div class="kjc_msg_words"><span>happy day!<br>
                                        这里有很多文字<br>
                                    超级多<br>
                                    非非常多</span>
                                    </div>
                                    <!-- 图片部分-->
                                    <div class="kjc_msg_img">
                                        <ul class="col-sm-8 col-xs-12 xiangce">
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--一条帖子的底部操作栏-->
                        <div class="col-sm-12 col-xs-12 message_bottom">
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-star-empty"></span>&nbsp;&nbsp;收藏&nbsp;
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-share"></span>&nbsp;&nbsp;转发&nbsp;
                                    <span class="badge">548</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a class="kjc_msg_operation_a kjc_pl_btn">
                                    <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;评论&nbsp;
                                    <span class="badge">9959</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation" style="border: none">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;
                                    <span class="badge">9954</span>
                                </a></div>
                        </div>

                        <!--一条帖子的评论部分 默认为隐藏起来-->
                        <div class="commentAll col-sm-12 col-xs-12">
                            <!--评论区域 begin-->
                            <div class="reviewArea clearfix">
                                <textarea class="content comment-input" placeholder="请输入您的评论，不超过140个字符&hellip;"
                                          onkeyup="keyUP(this)"></textarea>
                                <a href="javascript:;" class="plBtn">评论</a>
                            </div>
                            <!--评论区域 end-->
                            <!--回复区域 begin-->
                            <div class="comment-show">
                                <div class="comment-show-con clearfix">
                                    <!--评论中的头像-->
                                    <div class="comment-show-con-img pull-left"><a href="#" title="张三"><img
                                            src="images/header-img-comment_03.png" alt="" title="张三"></a></div>
                                    <!--评论右边部分-->
                                    <div class="comment-show-con-list pull-left clearfix">
                                        <!--上部分用户名和评论内容-->
                                        <div class="pl-text clearfix">
                                            <a href="#" class="comment-size-name">张三 : </a><!--用户名-->
                                            <span class="my-pl-con">&nbsp;来啊 造作啊!</span><!--评论内容-->
                                        </div>
                                        <!--下面部分时间和操作部分-->
                                        <div class="date-dz">
                                            <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                            <div class="date-dz-right pull-right comment-pl-block">
                                                <a href="javascript:;" class="removeBlock">删除</a>
                                                <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                <span class="pull-left date-dz-line">|</span>
                                                <a href="javascript:;" class="date-dz-z pull-left">
                                                    <i class="date-dz-z-click-red"></i>赞 (
                                                    <i class="z-num">666</i>)</a>
                                            </div>
                                        </div>
                                        <div class="hf-list-con"></div>
                                    </div>
                                </div>
                            </div>
                            <!--回复区域 end-->
                        </div>


                    </div>
                    <!--一条帖子结束-->

                    <!--一条帖子-->
                    <div class="row item_msg">
                        <!--一条帖子上面部分-->
                        <div class="col-sm-12 col-xs-12 message kjc_msg">
                            <!--左边头像部分-->
                            <div class="col-sm-2 col-xs-2">
                                <a href="#" title="Jack.C">
                                    <img src="img/icon.png" class="kjc_msg_face_img" style="border-radius: 50%"
                                         title="Jack.C">
                                </a>
                            </div>
                            <!-- 右边内容部分-->
                            <div class="col-sm-10 col-xs-10 kjc_msg_content">
                                <!--右边的顶上部分-->
                                <div class="kjc_user_name"> <span style="font-weight: bold;">
                                    <a href="#" class="kjc_msg_a kjc_user_a">Jack.C</a></span>
                                </div>
                                <div class="kjc_msg_info">
                                    <small class="date" style="color:#999"><a href="#" class="kjc_msg_a">1分钟前</a>
                                    </small>
                                    <span style="color:#999">来自<a href="#" class="kjc_msg_a">仲恺农业工程学院</a></span>
                                </div>
                                <!--右边内容部分-->
                                <div class="msg_content">
                                    <!--文字内容部分 -->
                                    <div class="kjc_msg_words"><span>happy day!<br>
                                        这里有很多文字<br>
                                    超级多<br>
                                    非非常多</span>
                                    </div>
                                    <!-- 图片部分-->
                                    <div class="kjc_msg_img">
                                        <ul class="col-sm-8 col-xs-12 xiangce">
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--一条帖子的底部操作栏-->
                        <div class="col-sm-12 col-xs-12 message_bottom">
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-star-empty"></span>&nbsp;&nbsp;收藏&nbsp;
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-share"></span>&nbsp;&nbsp;转发&nbsp;
                                    <span class="badge">548</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a class="kjc_msg_operation_a kjc_pl_btn">
                                    <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;评论&nbsp;
                                    <span class="badge">9959</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation" style="border: none">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;
                                    <span class="badge">9954</span>
                                </a></div>
                        </div>

                        <!--一条帖子的评论部分 默认为隐藏起来-->
                        <div class="commentAll col-sm-12 col-xs-12">
                            <!--评论区域 begin-->
                            <div class="reviewArea clearfix">
                                <textarea class="content comment-input" placeholder="请输入您的评论，不超过140个字符&hellip;"
                                          onkeyup="keyUP(this)"></textarea>
                                <a href="javascript:;" class="plBtn">评论</a>
                            </div>
                            <!--评论区域 end-->
                            <!--回复区域 begin-->
                            <div class="comment-show">
                                <div class="comment-show-con clearfix">
                                    <!--评论中的头像-->
                                    <div class="comment-show-con-img pull-left"><a href="#" title="张三"><img
                                            src="images/header-img-comment_03.png" alt="" title="张三"></a></div>
                                    <!--评论右边部分-->
                                    <div class="comment-show-con-list pull-left clearfix">
                                        <!--上部分用户名和评论内容-->
                                        <div class="pl-text clearfix">
                                            <a href="#" class="comment-size-name">张三 : </a><!--用户名-->
                                            <span class="my-pl-con">&nbsp;来啊 造作啊!</span><!--评论内容-->
                                        </div>
                                        <!--下面部分时间和操作部分-->
                                        <div class="date-dz">
                                            <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                            <div class="date-dz-right pull-right comment-pl-block">
                                                <a href="javascript:;" class="removeBlock">删除</a>
                                                <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                <span class="pull-left date-dz-line">|</span>
                                                <a href="javascript:;" class="date-dz-z pull-left">
                                                    <i class="date-dz-z-click-red"></i>赞 (
                                                    <i class="z-num">666</i>)</a>
                                            </div>
                                        </div>
                                        <div class="hf-list-con"></div>
                                    </div>
                                </div>
                            </div>
                            <!--回复区域 end-->
                        </div>


                    </div>
                    <!--一条帖子结束-->


                </div>

                <!--微校说说-->
                <div class="tab-pane fade" id="my_feelings">

                    <!--一条帖子-->
                    <div class="row item_msg">
                        <!--一条帖子上面部分-->
                        <div class="col-sm-12 col-xs-12 message kjc_msg">
                            <!--左边头像部分-->
                            <div class="col-sm-2 col-xs-2">
                                <a href="#" title="Jack.C">
                                    <img src="img/icon.png" class="kjc_msg_face_img" style="border-radius: 50%"
                                         title="Jack.C">
                                </a>
                            </div>
                            <!-- 右边内容部分-->
                            <div class="col-sm-10 col-xs-10 kjc_msg_content">
                                <!--右边的顶上部分-->
                                <div class="kjc_user_name"> <span style="font-weight: bold;">
                                    <a href="#" class="kjc_msg_a kjc_user_a">Jack.C</a></span>
                                </div>
                                <div class="kjc_msg_info">
                                    <small class="date" style="color:#999"><a href="#" class="kjc_msg_a">1分钟前</a>
                                    </small>
                                    <span style="color:#999">来自<a href="#" class="kjc_msg_a">仲恺农业工程学院</a></span>
                                </div>
                                <!--右边内容部分-->
                                <div class="msg_content">
                                    <!--文字内容部分 -->
                                    <div class="kjc_msg_words"><span>happy day!<br>
                                        这里有很多文字<br>
                                    超级多<br>
                                    非非常多</span>
                                    </div>
                                    <!-- 图片部分-->
                                    <div class="kjc_msg_img">
                                        <ul class="col-sm-8 col-xs-12 xiangce">
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>

                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--一条帖子的底部操作栏-->
                        <div class="col-sm-12 col-xs-12 message_bottom">
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-star-empty"></span>&nbsp;&nbsp;收藏&nbsp;
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-share"></span>&nbsp;&nbsp;转发&nbsp;
                                    <span class="badge">548</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a class="kjc_msg_operation_a kjc_pl_btn">
                                    <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;评论&nbsp;
                                    <span class="badge">9959</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation" style="border: none">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;
                                    <span class="badge">9954</span>
                                </a></div>
                        </div>

                        <!--一条帖子的评论部分 默认为隐藏起来-->
                        <div class="commentAll col-sm-12 col-xs-12">
                            <!--评论区域 begin-->
                            <div class="reviewArea clearfix">
                                <textarea class="content comment-input" placeholder="请输入您的评论，不超过140个字符&hellip;"
                                          onkeyup="keyUP(this)"></textarea>
                                <a href="javascript:;" class="plBtn">评论</a>
                            </div>
                            <!--评论区域 end-->
                            <!--回复区域 begin-->
                            <div class="comment-show">
                                <div class="comment-show-con clearfix">
                                    <!--评论中的头像-->
                                    <div class="comment-show-con-img pull-left"><a href="#" title="张三"><img
                                            src="images/header-img-comment_03.png" alt="" title="张三"></a></div>
                                    <!--评论右边部分-->
                                    <div class="comment-show-con-list pull-left clearfix">
                                        <!--上部分用户名和评论内容-->
                                        <div class="pl-text clearfix">
                                            <a href="#" class="comment-size-name">张三 : </a><!--用户名-->
                                            <span class="my-pl-con">&nbsp;来啊 造作啊!</span><!--评论内容-->
                                        </div>
                                        <!--下面部分时间和操作部分-->
                                        <div class="date-dz">
                                            <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                            <div class="date-dz-right pull-right comment-pl-block">
                                                <a href="javascript:;" class="removeBlock">删除</a>
                                                <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                <span class="pull-left date-dz-line">|</span>
                                                <a href="javascript:;" class="date-dz-z pull-left">
                                                    <i class="date-dz-z-click-red"></i>赞 (
                                                    <i class="z-num">666</i>)</a>
                                            </div>
                                        </div>
                                        <div class="hf-list-con"></div>
                                    </div>
                                </div>
                            </div>
                            <!--回复区域 end-->
                        </div>


                    </div>
                    <!--一条帖子结束-->

                    <!--一条帖子-->
                    <div class="row item_msg">
                        <!--一条帖子上面部分-->
                        <div class="col-sm-12 col-xs-12 message kjc_msg">
                            <!--左边头像部分-->
                            <div class="col-sm-2 col-xs-2">
                                <a href="#" title="Jack.C">
                                    <img src="img/icon.png" class="kjc_msg_face_img" style="border-radius: 50%"
                                         title="Jack.C">
                                </a>
                            </div>
                            <!-- 右边内容部分-->
                            <div class="col-sm-10 col-xs-10 kjc_msg_content">
                                <!--右边的顶上部分-->
                                <div class="kjc_user_name"> <span style="font-weight: bold;">
                                    <a href="#" class="kjc_msg_a kjc_user_a">Jack.C</a></span>
                                </div>
                                <div class="kjc_msg_info">
                                    <small class="date" style="color:#999"><a href="#" class="kjc_msg_a">1分钟前</a>
                                    </small>
                                    <span style="color:#999">来自<a href="#" class="kjc_msg_a">仲恺农业工程学院</a></span>
                                </div>
                                <!--右边内容部分-->
                                <div class="msg_content">
                                    <!--文字内容部分 -->
                                    <div class="kjc_msg_words"><span>happy day!<br>
                                        这里有很多文字<br>
                                    超级多<br>
                                    非非常多</span>
                                    </div>
                                    <!-- 图片部分-->
                                    <div class="kjc_msg_img">
                                        <ul class="col-sm-8 col-xs-12 xiangce">
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--一条帖子的底部操作栏-->
                        <div class="col-sm-12 col-xs-12 message_bottom">
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-star-empty"></span>&nbsp;&nbsp;收藏&nbsp;
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-share"></span>&nbsp;&nbsp;转发&nbsp;
                                    <span class="badge">548</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a class="kjc_msg_operation_a kjc_pl_btn">
                                    <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;评论&nbsp;
                                    <span class="badge">9959</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation" style="border: none">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;
                                    <span class="badge">9954</span>
                                </a></div>
                        </div>

                        <!--一条帖子的评论部分 默认为隐藏起来-->
                        <div class="commentAll col-sm-12 col-xs-12">
                            <!--评论区域 begin-->
                            <div class="reviewArea clearfix">
                                <textarea class="content comment-input" placeholder="请输入您的评论，不超过140个字符&hellip;"
                                          onkeyup="keyUP(this)"></textarea>
                                <a href="javascript:;" class="plBtn">评论</a>
                            </div>
                            <!--评论区域 end-->
                            <!--回复区域 begin-->
                            <div class="comment-show">
                                <div class="comment-show-con clearfix">
                                    <!--评论中的头像-->
                                    <div class="comment-show-con-img pull-left"><a href="#" title="张三"><img
                                            src="images/header-img-comment_03.png" alt="" title="张三"></a></div>
                                    <!--评论右边部分-->
                                    <div class="comment-show-con-list pull-left clearfix">
                                        <!--上部分用户名和评论内容-->
                                        <div class="pl-text clearfix">
                                            <a href="#" class="comment-size-name">张三 : </a><!--用户名-->
                                            <span class="my-pl-con">&nbsp;来啊 造作啊!</span><!--评论内容-->
                                        </div>
                                        <!--下面部分时间和操作部分-->
                                        <div class="date-dz">
                                            <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                            <div class="date-dz-right pull-right comment-pl-block">
                                                <a href="javascript:;" class="removeBlock">删除</a>
                                                <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                <span class="pull-left date-dz-line">|</span>
                                                <a href="javascript:;" class="date-dz-z pull-left">
                                                    <i class="date-dz-z-click-red"></i>赞 (
                                                    <i class="z-num">666</i>)</a>
                                            </div>
                                        </div>
                                        <div class="hf-list-con"></div>
                                    </div>
                                </div>
                            </div>
                            <!--回复区域 end-->
                        </div>


                    </div>
                    <!--一条帖子结束-->

                </div>

                <!-- ”就业“分类-->
                <div class="tab-pane fade" id="obtain_employment">

                    <!--一条帖子-->
                    <div class="row item_msg">
                        <!--一条帖子上面部分-->
                        <div class="col-sm-12 col-xs-12 message kjc_msg">
                            <!--左边头像部分-->
                            <div class="col-sm-2 col-xs-2">
                                <a href="#" title="Jack.C">
                                    <img src="img/icon.png" class="kjc_msg_face_img" style="border-radius: 50%"
                                         title="Jack.C">
                                </a>
                            </div>
                            <!-- 右边内容部分-->
                            <div class="col-sm-10 col-xs-10 kjc_msg_content">
                                <!--右边的顶上部分-->
                                <div class="kjc_user_name"> <span style="font-weight: bold;">
                                    <a href="#" class="kjc_msg_a kjc_user_a">Jack.C</a></span>
                                </div>
                                <div class="kjc_msg_info">
                                    <small class="date" style="color:#999"><a href="#" class="kjc_msg_a">1分钟前</a>
                                    </small>
                                    <span style="color:#999">来自<a href="#" class="kjc_msg_a">仲恺农业工程学院</a></span>
                                </div>
                                <!--右边内容部分-->
                                <div class="msg_content">
                                    <!--文字内容部分 -->
                                    <div class="kjc_msg_words"><span>happy day!<br>
                                        这里有很多文字<br>
                                    超级多<br>
                                    非非常多</span>
                                    </div>
                                    <!-- 图片部分-->
                                    <div class="kjc_msg_img">
                                        <ul class="col-sm-8 col-xs-12 xiangce">
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--一条帖子的底部操作栏-->
                        <div class="col-sm-12 col-xs-12 message_bottom">
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-star-empty"></span>&nbsp;&nbsp;收藏&nbsp;
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-share"></span>&nbsp;&nbsp;转发&nbsp;
                                    <span class="badge">548</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a class="kjc_msg_operation_a kjc_pl_btn">
                                    <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;评论&nbsp;
                                    <span class="badge">9959</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation" style="border: none">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;
                                    <span class="badge">9954</span>
                                </a></div>
                        </div>

                        <!--一条帖子的评论部分 默认为隐藏起来-->
                        <div class="commentAll col-sm-12 col-xs-12">
                            <!--评论区域 begin-->
                            <div class="reviewArea clearfix">
                                <textarea class="content comment-input" placeholder="请输入您的评论，不超过140个字符&hellip;"
                                          onkeyup="keyUP(this)"></textarea>
                                <a href="javascript:;" class="plBtn">评论</a>
                            </div>
                            <!--评论区域 end-->
                            <!--回复区域 begin-->
                            <div class="comment-show">
                                <div class="comment-show-con clearfix">
                                    <!--评论中的头像-->
                                    <div class="comment-show-con-img pull-left"><a href="#" title="张三"><img
                                            src="images/header-img-comment_03.png" alt="" title="张三"></a></div>
                                    <!--评论右边部分-->
                                    <div class="comment-show-con-list pull-left clearfix">
                                        <!--上部分用户名和评论内容-->
                                        <div class="pl-text clearfix">
                                            <a href="#" class="comment-size-name">张三 : </a><!--用户名-->
                                            <span class="my-pl-con">&nbsp;来啊 造作啊!</span><!--评论内容-->
                                        </div>
                                        <!--下面部分时间和操作部分-->
                                        <div class="date-dz">
                                            <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                            <div class="date-dz-right pull-right comment-pl-block">
                                                <a href="javascript:;" class="removeBlock">删除</a>
                                                <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                <span class="pull-left date-dz-line">|</span>
                                                <a href="javascript:;" class="date-dz-z pull-left">
                                                    <i class="date-dz-z-click-red"></i>赞 (
                                                    <i class="z-num">666</i>)</a>
                                            </div>
                                        </div>
                                        <div class="hf-list-con"></div>
                                    </div>
                                </div>
                            </div>
                            <!--回复区域 end-->
                        </div>


                    </div>
                    <!--一条帖子结束-->

                    <!--一条帖子-->
                    <div class="row item_msg">
                        <!--一条帖子上面部分-->
                        <div class="col-sm-12 col-xs-12 message kjc_msg">
                            <!--左边头像部分-->
                            <div class="col-sm-2 col-xs-2">
                                <a href="#" title="Jack.C">
                                    <img src="img/icon.png" class="kjc_msg_face_img" style="border-radius: 50%"
                                         title="Jack.C">
                                </a>
                            </div>
                            <!-- 右边内容部分-->
                            <div class="col-sm-10 col-xs-10 kjc_msg_content">
                                <!--右边的顶上部分-->
                                <div class="kjc_user_name"> <span style="font-weight: bold;">
                                    <a href="#" class="kjc_msg_a kjc_user_a">Jack.C</a></span>
                                </div>
                                <div class="kjc_msg_info">
                                    <small class="date" style="color:#999"><a href="#" class="kjc_msg_a">1分钟前</a>
                                    </small>
                                    <span style="color:#999">来自<a href="#" class="kjc_msg_a">仲恺农业工程学院</a></span>
                                </div>
                                <!--右边内容部分-->
                                <div class="msg_content">
                                    <!--文字内容部分 -->
                                    <div class="kjc_msg_words"><span>happy day!<br>
                                        这里有很多文字<br>
                                    超级多<br>
                                    非非常多</span>
                                    </div>
                                    <!-- 图片部分-->
                                    <div class="kjc_msg_img">
                                        <ul class="col-sm-8 col-xs-12 xiangce">
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--一条帖子的底部操作栏-->
                        <div class="col-sm-12 col-xs-12 message_bottom">
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-star-empty"></span>&nbsp;&nbsp;收藏&nbsp;
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-share"></span>&nbsp;&nbsp;转发&nbsp;
                                    <span class="badge">548</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a class="kjc_msg_operation_a kjc_pl_btn">
                                    <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;评论&nbsp;
                                    <span class="badge">9959</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation" style="border: none">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;
                                    <span class="badge">9954</span>
                                </a></div>
                        </div>

                        <!--一条帖子的评论部分 默认为隐藏起来-->
                        <div class="commentAll col-sm-12 col-xs-12">
                            <!--评论区域 begin-->
                            <div class="reviewArea clearfix">
                                <textarea class="content comment-input" placeholder="请输入您的评论，不超过140个字符&hellip;"
                                          onkeyup="keyUP(this)"></textarea>
                                <a href="javascript:;" class="plBtn">评论</a>
                            </div>
                            <!--评论区域 end-->
                            <!--回复区域 begin-->
                            <div class="comment-show">
                                <div class="comment-show-con clearfix">
                                    <!--评论中的头像-->
                                    <div class="comment-show-con-img pull-left"><a href="#" title="张三"><img
                                            src="images/header-img-comment_03.png" alt="" title="张三"></a></div>
                                    <!--评论右边部分-->
                                    <div class="comment-show-con-list pull-left clearfix">
                                        <!--上部分用户名和评论内容-->
                                        <div class="pl-text clearfix">
                                            <a href="#" class="comment-size-name">张三 : </a><!--用户名-->
                                            <span class="my-pl-con">&nbsp;来啊 造作啊!</span><!--评论内容-->
                                        </div>
                                        <!--下面部分时间和操作部分-->
                                        <div class="date-dz">
                                            <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                            <div class="date-dz-right pull-right comment-pl-block">
                                                <a href="javascript:;" class="removeBlock">删除</a>
                                                <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                <span class="pull-left date-dz-line">|</span>
                                                <a href="javascript:;" class="date-dz-z pull-left">
                                                    <i class="date-dz-z-click-red"></i>赞 (
                                                    <i class="z-num">666</i>)</a>
                                            </div>
                                        </div>
                                        <div class="hf-list-con"></div>
                                    </div>
                                </div>
                            </div>
                            <!--回复区域 end-->
                        </div>


                    </div>
                    <!--一条帖子结束-->

                </div>

                <!--“社团活动”分类-->
                <div class="tab-pane fade" id="club_activity">

                    <!--一条帖子-->
                    <div class="row item_msg">
                        <!--一条帖子上面部分-->
                        <div class="col-sm-12 col-xs-12 message kjc_msg">
                            <!--左边头像部分-->
                            <div class="col-sm-2 col-xs-2">
                                <a href="#" title="Jack.C">
                                    <img src="img/icon.png" class="kjc_msg_face_img" style="border-radius: 50%"
                                         title="Jack.C">
                                </a>
                            </div>
                            <!-- 右边内容部分-->
                            <div class="col-sm-10 col-xs-10 kjc_msg_content">
                                <!--右边的顶上部分-->
                                <div class="kjc_user_name"> <span style="font-weight: bold;">
                                    <a href="#" class="kjc_msg_a kjc_user_a">Jack.C</a></span>
                                </div>
                                <div class="kjc_msg_info">
                                    <small class="date" style="color:#999"><a href="#" class="kjc_msg_a">1分钟前</a>
                                    </small>
                                    <span style="color:#999">来自<a href="#" class="kjc_msg_a">仲恺农业工程学院</a></span>
                                </div>
                                <!--右边内容部分-->
                                <div class="msg_content">
                                    <!--文字内容部分 -->
                                    <div class="kjc_msg_words"><span>happy day!<br>
                                        这里有很多文字<br>
                                    超级多<br>
                                    非非常多</span>
                                    </div>
                                    <!-- 图片部分-->
                                    <div class="kjc_msg_img">
                                        <ul class="col-sm-8 col-xs-12 xiangce">
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--一条帖子的底部操作栏-->
                        <div class="col-sm-12 col-xs-12 message_bottom">
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-star-empty"></span>&nbsp;&nbsp;收藏&nbsp;
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-share"></span>&nbsp;&nbsp;转发&nbsp;
                                    <span class="badge">548</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a class="kjc_msg_operation_a kjc_pl_btn">
                                    <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;评论&nbsp;
                                    <span class="badge">9959</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation" style="border: none">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;
                                    <span class="badge">9954</span>
                                </a></div>
                        </div>

                        <!--一条帖子的评论部分 默认为隐藏起来-->
                        <div class="commentAll col-sm-12 col-xs-12">
                            <!--评论区域 begin-->
                            <div class="reviewArea clearfix">
                                <textarea class="content comment-input" placeholder="请输入您的评论，不超过140个字符&hellip;"
                                          onkeyup="keyUP(this)"></textarea>
                                <a href="javascript:;" class="plBtn">评论</a>
                            </div>
                            <!--评论区域 end-->
                            <!--回复区域 begin-->
                            <div class="comment-show">
                                <div class="comment-show-con clearfix">
                                    <!--评论中的头像-->
                                    <div class="comment-show-con-img pull-left"><a href="#" title="张三"><img
                                            src="images/header-img-comment_03.png" alt="" title="张三"></a></div>
                                    <!--评论右边部分-->
                                    <div class="comment-show-con-list pull-left clearfix">
                                        <!--上部分用户名和评论内容-->
                                        <div class="pl-text clearfix">
                                            <a href="#" class="comment-size-name">张三 : </a><!--用户名-->
                                            <span class="my-pl-con">&nbsp;来啊 造作啊!</span><!--评论内容-->
                                        </div>
                                        <!--下面部分时间和操作部分-->
                                        <div class="date-dz">
                                            <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                            <div class="date-dz-right pull-right comment-pl-block">
                                                <a href="javascript:;" class="removeBlock">删除</a>
                                                <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                <span class="pull-left date-dz-line">|</span>
                                                <a href="javascript:;" class="date-dz-z pull-left">
                                                    <i class="date-dz-z-click-red"></i>赞 (
                                                    <i class="z-num">666</i>)</a>
                                            </div>
                                        </div>
                                        <div class="hf-list-con"></div>
                                    </div>
                                </div>
                            </div>
                            <!--回复区域 end-->
                        </div>


                    </div>
                    <!--一条帖子结束-->


                    <!--一条帖子-->
                    <div class="row item_msg">
                        <!--一条帖子上面部分-->
                        <div class="col-sm-12 col-xs-12 message kjc_msg">
                            <!--左边头像部分-->
                            <div class="col-sm-2 col-xs-2">
                                <a href="#" title="Jack.C">
                                    <img src="img/icon.png" class="kjc_msg_face_img" style="border-radius: 50%"
                                         title="Jack.C">
                                </a>
                            </div>
                            <!-- 右边内容部分-->
                            <div class="col-sm-10 col-xs-10 kjc_msg_content">
                                <!--右边的顶上部分-->
                                <div class="kjc_user_name"> <span style="font-weight: bold;">
                                    <a href="#" class="kjc_msg_a kjc_user_a">Jack.C</a></span>
                                </div>
                                <div class="kjc_msg_info">
                                    <small class="date" style="color:#999"><a href="#" class="kjc_msg_a">1分钟前</a>
                                    </small>
                                    <span style="color:#999">来自<a href="#" class="kjc_msg_a">仲恺农业工程学院</a></span>
                                </div>
                                <!--右边内容部分-->
                                <div class="msg_content">
                                    <!--文字内容部分 -->
                                    <div class="kjc_msg_words"><span>happy day!<br>
                                        这里有很多文字<br>
                                    超级多<br>
                                    非非常多</span>
                                    </div>
                                    <!-- 图片部分-->
                                    <div class="kjc_msg_img">
                                        <ul class="col-sm-8 col-xs-12 xiangce">
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--一条帖子的底部操作栏-->
                        <div class="col-sm-12 col-xs-12 message_bottom">
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-star-empty"></span>&nbsp;&nbsp;收藏&nbsp;
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-share"></span>&nbsp;&nbsp;转发&nbsp;
                                    <span class="badge">548</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a class="kjc_msg_operation_a kjc_pl_btn">
                                    <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;评论&nbsp;
                                    <span class="badge">9959</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation" style="border: none">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;
                                    <span class="badge">9954</span>
                                </a></div>
                        </div>

                        <!--一条帖子的评论部分 默认为隐藏起来-->
                        <div class="commentAll col-sm-12 col-xs-12">
                            <!--评论区域 begin-->
                            <div class="reviewArea clearfix">
                                <textarea class="content comment-input" placeholder="请输入您的评论，不超过140个字符&hellip;"
                                          onkeyup="keyUP(this)"></textarea>
                                <a href="javascript:;" class="plBtn">评论</a>
                            </div>
                            <!--评论区域 end-->
                            <!--回复区域 begin-->
                            <div class="comment-show">
                                <div class="comment-show-con clearfix">
                                    <!--评论中的头像-->
                                    <div class="comment-show-con-img pull-left"><a href="#" title="张三"><img
                                            src="images/header-img-comment_03.png" alt="" title="张三"></a></div>
                                    <!--评论右边部分-->
                                    <div class="comment-show-con-list pull-left clearfix">
                                        <!--上部分用户名和评论内容-->
                                        <div class="pl-text clearfix">
                                            <a href="#" class="comment-size-name">张三 : </a><!--用户名-->
                                            <span class="my-pl-con">&nbsp;来啊 造作啊!</span><!--评论内容-->
                                        </div>
                                        <!--下面部分时间和操作部分-->
                                        <div class="date-dz">
                                            <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                            <div class="date-dz-right pull-right comment-pl-block">
                                                <a href="javascript:;" class="removeBlock">删除</a>
                                                <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                <span class="pull-left date-dz-line">|</span>
                                                <a href="javascript:;" class="date-dz-z pull-left">
                                                    <i class="date-dz-z-click-red"></i>赞 (
                                                    <i class="z-num">666</i>)</a>
                                            </div>
                                        </div>
                                        <div class="hf-list-con"></div>
                                    </div>
                                </div>
                            </div>
                            <!--回复区域 end-->
                        </div>


                    </div>
                    <!--一条帖子结束-->

                </div>

                <!--“学习”分类-->
                <div class="tab-pane fade" id="study">


                    <!--一条帖子-->
                    <div class="row item_msg">
                        <!--一条帖子上面部分-->
                        <div class="col-sm-12 col-xs-12 message kjc_msg">
                            <!--左边头像部分-->
                            <div class="col-sm-2 col-xs-2">
                                <a href="#" title="Jack.C">
                                    <img src="img/icon.png" class="kjc_msg_face_img" style="border-radius: 50%"
                                         title="Jack.C">
                                </a>
                            </div>
                            <!-- 右边内容部分-->
                            <div class="col-sm-10 col-xs-10 kjc_msg_content">
                                <!--右边的顶上部分-->
                                <div class="kjc_user_name"> <span style="font-weight: bold;">
                                    <a href="#" class="kjc_msg_a kjc_user_a">Jack.C</a></span>
                                </div>
                                <div class="kjc_msg_info">
                                    <small class="date" style="color:#999"><a href="#" class="kjc_msg_a">1分钟前</a>
                                    </small>
                                    <span style="color:#999">来自<a href="#" class="kjc_msg_a">仲恺农业工程学院</a></span>
                                </div>
                                <!--右边内容部分-->
                                <div class="msg_content">
                                    <!--文字内容部分 -->
                                    <div class="kjc_msg_words"><span>happy day!<br>
                                        这里有很多文字<br>
                                    超级多<br>
                                    非非常多</span>
                                    </div>
                                    <!-- 图片部分-->
                                    <div class="kjc_msg_img">
                                        <ul class="col-sm-8 col-xs-12 xiangce">
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--一条帖子的底部操作栏-->
                        <div class="col-sm-12 col-xs-12 message_bottom">
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-star-empty"></span>&nbsp;&nbsp;收藏&nbsp;
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-share"></span>&nbsp;&nbsp;转发&nbsp;
                                    <span class="badge">548</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a class="kjc_msg_operation_a kjc_pl_btn">
                                    <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;评论&nbsp;
                                    <span class="badge">9959</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation" style="border: none">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;
                                    <span class="badge">9954</span>
                                </a></div>
                        </div>

                        <!--一条帖子的评论部分 默认为隐藏起来-->
                        <div class="commentAll col-sm-12 col-xs-12">
                            <!--评论区域 begin-->
                            <div class="reviewArea clearfix">
                                <textarea class="content comment-input" placeholder="请输入您的评论，不超过140个字符&hellip;"
                                          onkeyup="keyUP(this)"></textarea>
                                <a href="javascript:;" class="plBtn">评论</a>
                            </div>
                            <!--评论区域 end-->
                            <!--回复区域 begin-->
                            <div class="comment-show">
                                <div class="comment-show-con clearfix">
                                    <!--评论中的头像-->
                                    <div class="comment-show-con-img pull-left"><a href="#" title="张三"><img
                                            src="images/header-img-comment_03.png" alt="" title="张三"></a></div>
                                    <!--评论右边部分-->
                                    <div class="comment-show-con-list pull-left clearfix">
                                        <!--上部分用户名和评论内容-->
                                        <div class="pl-text clearfix">
                                            <a href="#" class="comment-size-name">张三 : </a><!--用户名-->
                                            <span class="my-pl-con">&nbsp;来啊 造作啊!</span><!--评论内容-->
                                        </div>
                                        <!--下面部分时间和操作部分-->
                                        <div class="date-dz">
                                            <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                            <div class="date-dz-right pull-right comment-pl-block">
                                                <a href="javascript:;" class="removeBlock">删除</a>
                                                <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                <span class="pull-left date-dz-line">|</span>
                                                <a href="javascript:;" class="date-dz-z pull-left">
                                                    <i class="date-dz-z-click-red"></i>赞 (
                                                    <i class="z-num">666</i>)</a>
                                            </div>
                                        </div>
                                        <div class="hf-list-con"></div>
                                    </div>
                                </div>
                            </div>
                            <!--回复区域 end-->
                        </div>


                    </div>
                    <!--一条帖子结束-->

                    <!--一条帖子-->
                    <div class="row item_msg">
                        <!--一条帖子上面部分-->
                        <div class="col-sm-12 col-xs-12 message kjc_msg">
                            <!--左边头像部分-->
                            <div class="col-sm-2 col-xs-2">
                                <a href="#" title="Jack.C">
                                    <img src="img/icon.png" class="kjc_msg_face_img" style="border-radius: 50%"
                                         title="Jack.C">
                                </a>
                            </div>
                            <!-- 右边内容部分-->
                            <div class="col-sm-10 col-xs-10 kjc_msg_content">
                                <!--右边的顶上部分-->
                                <div class="kjc_user_name"> <span style="font-weight: bold;">
                                    <a href="#" class="kjc_msg_a kjc_user_a">Jack.C</a></span>
                                </div>
                                <div class="kjc_msg_info">
                                    <small class="date" style="color:#999"><a href="#" class="kjc_msg_a">1分钟前</a>
                                    </small>
                                    <span style="color:#999">来自<a href="#" class="kjc_msg_a">仲恺农业工程学院</a></span>
                                </div>
                                <!--右边内容部分-->
                                <div class="msg_content">
                                    <!--文字内容部分 -->
                                    <div class="kjc_msg_words"><span>happy day!<br>
                                        这里有很多文字<br>
                                    超级多<br>
                                    非非常多</span>
                                    </div>
                                    <!-- 图片部分-->
                                    <div class="kjc_msg_img">
                                        <ul class="col-sm-8 col-xs-12 xiangce">
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>
                                            <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                <img class="mypic" src="img/bg_1.jpg"></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--一条帖子的底部操作栏-->
                        <div class="col-sm-12 col-xs-12 message_bottom">
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-star-empty"></span>&nbsp;&nbsp;收藏&nbsp;
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-share"></span>&nbsp;&nbsp;转发&nbsp;
                                    <span class="badge">548</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                <a class="kjc_msg_operation_a kjc_pl_btn">
                                    <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;评论&nbsp;
                                    <span class="badge">9959</span>
                                </a></div>
                            <div class="col-sm-3 col-xs-3 kjc_message_operation" style="border: none">
                                <a href="#" class="kjc_msg_operation_a">
                                    <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;
                                    <span class="badge">9954</span>
                                </a></div>
                        </div>

                        <!--一条帖子的评论部分 默认为隐藏起来-->
                        <div class="commentAll col-sm-12 col-xs-12">
                            <!--评论区域 begin-->
                            <div class="reviewArea clearfix">
                                <textarea class="content comment-input" placeholder="请输入您的评论，不超过140个字符&hellip;"
                                          onkeyup="keyUP(this)"></textarea>
                                <a href="javascript:;" class="plBtn">评论</a>
                            </div>
                            <!--评论区域 end-->
                            <!--回复区域 begin-->
                            <div class="comment-show">
                                <div class="comment-show-con clearfix">
                                    <!--评论中的头像-->
                                    <div class="comment-show-con-img pull-left"><a href="#" title="张三"><img
                                            src="images/header-img-comment_03.png" alt="" title="张三"></a></div>
                                    <!--评论右边部分-->
                                    <div class="comment-show-con-list pull-left clearfix">
                                        <!--上部分用户名和评论内容-->
                                        <div class="pl-text clearfix">
                                            <a href="#" class="comment-size-name">张三 : </a><!--用户名-->
                                            <span class="my-pl-con">&nbsp;来啊 造作啊!</span><!--评论内容-->
                                        </div>
                                        <!--下面部分时间和操作部分-->
                                        <div class="date-dz">
                                            <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                            <div class="date-dz-right pull-right comment-pl-block">
                                                <a href="javascript:;" class="removeBlock">删除</a>
                                                <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                <span class="pull-left date-dz-line">|</span>
                                                <a href="javascript:;" class="date-dz-z pull-left">
                                                    <i class="date-dz-z-click-red"></i>赞 (
                                                    <i class="z-num">666</i>)</a>
                                            </div>
                                        </div>
                                        <div class="hf-list-con"></div>
                                    </div>
                                </div>
                            </div>
                            <!--回复区域 end-->
                        </div>


                    </div>
                    <!--一条帖子结束-->

                </div>


            </div>


        </div>

        <!--右边-->
        <div class="col-sm-3 col-xs-12 part_right">
            <!--热点推荐部分-->
            <div class="row part_hot">
                <div class="col-sm-12">
                    <a href="#"></a> <span class="pull-left" style="padding: 10px;font-size:16px;font-weight: bold;">热门话题</span>
                    <a href="#"><span class="glyphicon glyphicon-refresh pull-right"
                                      style="padding: 13px 0px 10px 5px;"></span>&nbsp;&nbsp;
                        <span class=" pull-right" style="padding: 10px 0px 10px 0px;">换话题</span></a>
                </div>
                <hr style="margin: 0;padding: 0;width: 100%">

                <div class="col-sm-12 item_hot">
                    <span class="pull-left">#英雄联盟s7#</span>
                    <span class="pull-right item_num">2.6亿</span>
                </div>

                <div class="col-sm-12 item_hot">
                    <span class="pull-left">#今天霜降#</span>
                    <span class="pull-right item_num">2.6亿</span>
                </div>

                <div class="col-sm-12 item_hot">
                    <span class="pull-left">#亚洲新歌榜#</span>
                    <span class="pull-right item_num">10.4亿</span>
                </div>

                <div class="col-sm-12 item_hot">
                    <span class="pull-left">#扑通扑通少女心#</span>
                    <span class="pull-right item_num">1.5亿</span>
                </div>

                <div class="col-sm-12 item_hot">
                    <span class="pull-left">#突然开心#</span>
                    <span class="pull-right item_num">1.1亿</span>
                </div>
                <hr style="margin: 0;padding: 0;width: 100%">

                <div class="col-sm-12 text-center" style="padding: 10px"><a href="#">查看更多</a></div>

            </div>


        </div>
    </div>


</div>
<script src="/bysj/jar/js/jquery-3.1.0.js"></script>
<script src="/bysj/jar/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="/bysj/base/js/text_area.js"></script>
<script src="/bysj/jar/js/bootstrap-select-1.12.4/dist/js/bootstrap-select.js"></script><!--下拉选择列表的js-->
<!--<script src="/bysj/base/js/navigation_bar.js"></script>-->
<script src="/bysj/base/js/show_img.js"></script><!--图片浏览js-->

<script type="text/javascript" src="js/jquery.flexText.js"></script><!--评论的输入框插件-->
<script type="text/javascript" src="js/comment_operation.js"></script><!--评论功能的jsF-->
</body>

</html>