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
    <title>我的个人主页</title>
    <link rel="stylesheet" href="/bysj/jar/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/bysj/base/css/style.css">
    <link rel="stylesheet" type="text/css" href="/bysj/jar/js/bootstrap-select-1.12.4/dist/css/bootstrap-select.css">
    <link rel="stylesheet" type="text/css" href="/bysj/base/css/navigation_bar.css">
    <link rel="stylesheet" type="text/css" href="/bysj/base/css/show_img.css">
    <link rel="stylesheet" href="/bysj/base/css/comment_style.css">
    <link rel="stylesheet" href="/bysj/base/css/comment.css">
    <link rel="stylesheet" href="/bysj/base/css/upload.css"><!--图片上传-->
</head>
<body>
<!--顶部导航栏-->
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
                <%-- <li><a href="#"><i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;<strong>私信</strong>&nbsp;<span
                         class="badge">99+</span></a></li>--%>
                <li id="user_id"><a href="/bysj/base/personal_homepage.jsp"><i
                        class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;<span></span></a>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        设置 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/bysj/base/login_or_register/no_account_index.jsp">登录</a></li>
                        <li><a href="/bysj/base/login_or_register/no_account_index.jsp">注册</a></li>

                    </ul>
                </li>
            </ul>

        </div>


    </div>
    <hr style="margin: 0;padding: 0;color:#222;width: 100%">
</nav>

<div class="container container_bg myhomepage">
    <div class="row">
        <!--顶部-->
        <div class="col-sm-12 col-xs-12 myhomepage_top">
            <div class="row text-center my_homepage_bg">
                <a href="javascript:void(0);" class="User_Account_Img" onclick="updateHeadPicClick()"><img
                        src="img/icon.png"></a>
                <a href="/bysj/base/personal_homepage.jsp" class="User_Account_Img"><h4 style="font-weight: bold;">
                    <span></span></h4></a>
                <%----%>
                <div class="W_layer W_layer_pop layer_upload display_none"
                     id="updateHeadPic_layer_upload"
                     style="left: 4px; top: 42px;">
                    <div class="content">
                        <div class="W_layer_close">
                            <a href="javascript:void(0)" node-type="close"
                               class="W_ficon ficon_close S_ficon">X</a>
                        </div>
                        <div node-type="inner">
                            <div class="layer_pic_list clearfix" style="width: 145px;" node-type="box">
                                <div class="W_layer_con_tit"><h1 class="W_f14 W_fb">更换头像</h1>
                                </div>
                                <form id="updateHeadForm"
                                      method="post"
                                      enctype="multipart/form-data">
                                    <div class="box">
                                    </div>
                                </form>
                                <button onclick="updateHead()">上传图片</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%----%>
            </div>
            <!--分类标签导航栏-->
            <div class="row navigation_bar">
                <div class="col-sm-6 col-xs-12" id="ex3_content">
                    <ul class="nav nav-pills" id="myTab">
                        <li class="active" style="margin-right: 100px">
                            <a href="#personal_homepage" data-toggle="pill" onclick="show_persional_homePage()">我的主页</a>
                            <div class="arrow"></div>
                        </li>
                        <%--  <li style="margin-right: 100px">
                              <a href="#my_photo_album" data-toggle="pill">我的相册</a>
                              <div class="arrow"></div>
                          </li>
                          <li>
                              <a href="#management_center " data-toggle="pill">管理中心</a>
                              <div class="arrow"></div>
                          </li>--%>
                    </ul>
                </div>
            </div>
        </div>

        <!--分类容器-->
        <div class="tab-content kjc_content_container Navigation_bar_classification">
            <!--我的主页容器-->
            <div class="tab-pane fade in active" id="personal_homepage">
                <!--左边-->
                <div class="myhomepage_bottom_left pull-left">
                    <!--粉丝关注数量部分-->
                    <div class="row text-center inform count">
                        <div class="col-sm-12 my_inform">
                            <div class="col-sm-4 col-xs-4" style="border-right: 1px solid rgba(9,4,4,0.47);">
                                <a href="javascript:go_to_follow(this,event)">
                                    <div class="followNumb"><i class="z-num"></i></div>
                                    <div class="">关注</div>
                                </a>
                            </div>
                            <div class="col-sm-4 col-xs-4" style="border-right: 1px solid rgba(9,4,4,0.47);">
                                <a href="javascript:void(0)">
                                    <div class="fansNumb"><i class="z-num"></i></div>
                                    <div class="">粉丝</div>
                                </a>
                            </div>
                            <div class="col-sm-4 col-xs-4">
                                <a href="javascript:void(0)">
                                    <div class="myMsgNumb"><i class="z-num"></i></div>
                                    <div class="">微校</div>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!--个人信息块-->
                    <div class="row text_center inform personal_info">
                        <div class="identification">
                            <span class="is_Validate"
                                  style="color: rgba(30,148,174,0.9);font-size: 15px;font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;"></span>
                            <span style="color: #8c8c8c;font-size: 15px;margin-left: 20px"> |</span>
                        </div>
                        <div class="brief" style="padding: 10px;">

                        </div>
                        <div style="height: 34px;text-align: center; line-height: 34px; border-top: rgba(193, 193, 193, 0.81) 1px solid;">
                            <a href="javascript:void(0)" class="edit_operation" id="edit_operation"
                               onclick="personal_Info_Edit(this)"><span>点击编辑个人信息>></span></a>
                        </div>
                    </div>


                </div>
                <!--右边-->
                <div class="myhomepage_bottom-right pull-right">

                    <!--信息分类标签导航栏-->
                    <div class="row navigation_bar">
                        <ul class="nav nav-pills col-sm-3">
                            <li class="active">
                                <a href="#all" data-toggle="pill">全部</a>
                                <div class="arrow"></div>
                            </li>
                            <li>
                                <a href="#my_feelings" data-toggle="pill">微校说说</a>
                                <div class="arrow"></div>
                            </li>
                            <li>
                                <a href="#obtain_employment" data-toggle="pill">就业</a>
                                <div class="arrow"></div>
                            </li>
                            <li>
                                <a href="#club_activity" data-toggle="pill">社团活动</a>
                                <div class="arrow"></div>
                            </li>
                            <li>
                                <a href="#study" data-toggle="pill">学习交流</a>
                                <div class="arrow"></div>
                            </li>
                        </ul>
                        <form class="navbar-form col-sm-3 pull-right" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="#搜索我关注人的微校#">
                                <i class="glyphicon glyphicon-search btn_search"></i>
                                <!--  <button type="submit" class="btn btn-default">提交</button> -->
                            </div>
                        </form>
                    </div>

                    <!--信息容器-->
                    <div class="tab-content kjc_content_container">

                        <!--“全部”分类对应的信息容器-->
                        <div class="tab-pane fade in active" id="all">


                        </div>

                        <!--微校说说-->
                        <div class="tab-pane fade" id="my_feelings">


                        </div>

                        <!-- ”就业“分类-->
                        <div class="tab-pane fade" id="obtain_employment">


                        </div>

                        <!--“社团活动”分类-->
                        <div class="tab-pane fade" id="club_activity">


                        </div>

                        <!--“学习”分类-->
                        <div class="tab-pane fade" id="study">


                        </div>


                    </div>

                    <!--个人信息编辑块-->
                    <div class="row personal_info_edit tav-pane fade">
                        <div style="background-color: white;padding-bottom: 15px;border-radius: 3px;">
                            <!--基本信息分割线-->
                            <div class="pull_left"
                                 style="position: relative;line-height: 30px;height: 30px; margin-bottom: 10px;">
                                <span class="col-sm-2">基本信息</span>
                                <span class="col-sm-8"
                                      style="height:1px;border-color: #8c0b07;background-color:#8c0b07;margin-top: 15px;"></span>
                                <span class="col-sm-2" style="padding: 0px 15px 0px 0px; display:block; "> <button
                                        type="button" class="btn btn-default btn-group-sm"
                                        onclick="saveOrUpdate_User_info(this)">保存基本信息</button></span>
                            </div>
                            <!--基本信息表单-->
                            <div id='personal_info' style="padding-right: 15px;">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group id" style="display: none;">
                                        <label class="col-sm-2 control-label">id:</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" type="text"
                                                   value="">
                                        </div>
                                    </div>
                                    <div class="form-group phone">
                                        <label class="col-sm-2 control-label">登录名:</label>
                                        <div class="col-sm-10">
                                            <input class="form-control pull-left" id="focusedInput" type="text"
                                                   value="这里是登录账号"
                                                   style="width: 326px; ">
                                            <div class="pull-left sign_div">  <span
                                                    class="glyphicon glyphicon-asterisk sign_span"></span>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group password">
                                        <label for="inputPassword" class="col-sm-2 control-label">密码:</label>
                                        <div class="col-sm-10">
                                            <input class="form-control pull-left" id="disabledInput" type="text"
                                                   placeholder="这里是密码" disabled="disabled" style="width: 326px;">
                                            <div class="pull-left sign_div">  <span
                                                    class="glyphicon glyphicon-asterisk sign_span"></span>
                                            </div>
                                            <a href="#" class="pull-right"><span>点击修改密码</span></a>
                                        </div>
                                    </div>
                                    <div class="form-group nickname">
                                        <label class="col-sm-2 control-label nickname">昵称:</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control pull-left" style="width: 326px;">
                                            <div class="pull-left sign_div">  <span
                                                    class="glyphicon glyphicon-asterisk sign_span"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group realName student_type">
                                        <label class="col-sm-2 control-label">真实姓名:</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control pull-left" placeholder="真是姓名与身份证一致"
                                                   style="width: 326px;">
                                            <div class="pull-left sign_div">  <span
                                                    class="glyphicon glyphicon-asterisk sign_span"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group identity_card student_type">
                                        <label class="col-sm-2 control-label">身份证号码:</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control pull-left" style="width: 326px;">
                                            <div class="pull-left sign_div">  <span
                                                    class="glyphicon glyphicon-asterisk sign_span"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group school_id">
                                        <label class="col-sm-2 control-label" for="inputWarning">学校：</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control pull-left" disabled="disabled"
                                                   id="inputWarning"
                                                   style="width: 326px;">
                                            <div class="pull-left sign_div">  <span
                                                    class="glyphicon glyphicon-asterisk sign_span"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group student_number student_type">
                                        <label class="col-sm-2 control-label">学号:</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control pull-left" style="width: 326px;">
                                            <div class="pull-left sign_div">  <span
                                                    class="glyphicon glyphicon-asterisk sign_span"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group student_major student_type">
                                        <label class="col-sm-2 control-label">专业：</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control pull-left" style="width: 326px;">
                                            <div class="pull-left sign_div">  <span
                                                    class="glyphicon glyphicon-asterisk sign_span"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group student_class student_type">
                                        <label class="col-sm-2 control-label">班级：</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control pull-left" style="width: 326px;">
                                            <div class="pull-left sign_div">
                                                <span class="glyphicon glyphicon-asterisk sign_span"></span>
                                                <!-- <span class="add" style="color: red;"> 必填</span>-->
                                                <!--<span class="glyphicon glyphicon-ok-circle sign_span_ok"></span>-->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group club_name club_type">
                                        <label class="col-sm-2 control-label">社团名：</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control pull-left" style="width: 326px;">
                                            <div class="pull-left sign_div">  <span
                                                    class="glyphicon glyphicon-asterisk sign_span"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group admin_type school_type">
                                        <label class="col-sm-2 control-label">身份：</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control pull-left" disabled="disabled"
                                                   style="width: 326px;">
                                            <div class="pull-left sign_div">  <span
                                                    class="glyphicon glyphicon-asterisk sign_span"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group brief_introduction school_type">
                                        <label class="col-sm-2 control-label">简介：</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control pull-left" style="width: 326px;">
                                            <div class="pull-left sign_div">  <span
                                                    class="glyphicon glyphicon-asterisk sign_span"></span>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>

                </div>

            </div>

            <!--我的相册-->
            <div class="tab-pane fade" id="my_photo_album">
                <div class="col-sm-12 col-xs-12  personal_space_albums">
                    <ul class="col-sm-12 col-xs-12 xiangce">
                        <!--一张图片 -->
                        <li class="col-sm-3 col-xs-3 list">
                            <div class="album_img" style="height: 250px;position: relative;">
                                <!--图片点赞操作-->
                                <div class="img_good" title="点个赞咯" id="good" onclick="good(this,event)">
                                    <!--onclick="good(this )"-->
                                    <span class="glyphicon glyphicon-thumbs-up btn-lg good_botton"
                                          style=" font-size: 30px"></span>
                                </div>
                                <div>
                                    <img class="mypic" src="img/bg_1.jpg">
                                </div>
                                <!--图片底部操作-->
                                <div class="img_oporation">
                                    <span>删除</span>
                                    <span></span>
                                </div>
                            </div>
                        </li>
                        <li class="col-sm-3 col-xs-3 list">
                            <div class="album_img" style="height: 250px;position: relative;">
                                <!--图片点赞操作-->
                                <div class="img_good" title="点个赞咯" id="good" onclick="good(this,event)">
                                    <!--onclick="good(this )"-->
                                    <span class="glyphicon glyphicon-thumbs-up btn-lg good_botton"
                                          style=" font-size: 30px"></span>
                                </div>
                                <div>
                                    <img class="mypic" src="img/bg_1.jpg">
                                </div>
                                <!--图片底部操作-->
                                <div class="img_oporation">
                                    <span>删除</span>
                                    <span></span>
                                </div>
                            </div>
                        </li>
                        <li class="col-sm-3 col-xs-3 list">
                            <div class="album_img" style="height: 250px;position: relative;">
                                <!--图片点赞操作-->
                                <div class="img_good" title="点个赞咯" id="good" onclick="good(this,event)">
                                    <!--onclick="good(this )"-->
                                    <span class="glyphicon glyphicon-thumbs-up btn-lg good_botton"
                                          style=" font-size: 30px"></span>
                                </div>
                                <div>
                                    <img class="mypic" src="img/bg_1.jpg">
                                </div>
                                <!--图片底部操作-->
                                <div class="img_oporation">
                                    <span>删除</span>
                                    <span></span>
                                </div>
                            </div>
                        </li>
                        <li class="col-sm-3 col-xs-3 list">
                            <div class="album_img" style="height: 250px;position: relative;">
                                <!--图片点赞操作-->
                                <div class="img_good" title="点个赞咯" id="good" onclick="good(this,event)">
                                    <!--onclick="good(this )"-->
                                    <span class="glyphicon glyphicon-thumbs-up btn-lg good_botton"
                                          style=" font-size: 30px"></span>
                                </div>
                                <div>
                                    <img class="mypic" src="img/bg_1.jpg">
                                </div>
                                <!--图片底部操作-->
                                <div class="img_oporation">
                                    <span>删除</span>
                                    <span></span>
                                </div>
                            </div>
                        </li>
                        <li class="col-sm-3 col-xs-3 list">
                            <div class="album_img" style="height: 250px;position: relative;">
                                <!--图片点赞操作-->
                                <div class="img_good" title="点个赞咯" id="good" onclick="good(this,event)">
                                    <!--onclick="good(this )"-->
                                    <span class="glyphicon glyphicon-thumbs-up btn-lg good_botton"
                                          style=" font-size: 30px"></span>
                                </div>
                                <div>
                                    <img class="mypic" src="img/bg_1.jpg">
                                </div>
                                <!--图片底部操作-->
                                <div class="img_oporation">
                                    <span>删除</span>
                                    <span></span>
                                </div>
                            </div>
                        </li>
                        <li class="col-sm-3 col-xs-3 list">
                            <div class="album_img" style="height: 250px;position: relative;">
                                <!--图片点赞操作-->
                                <div class="img_good" title="点个赞咯" id="good" onclick="good(this,event)">
                                    <!--onclick="good(this )"-->
                                    <span class="glyphicon glyphicon-thumbs-up btn-lg good_botton"
                                          style=" font-size: 30px"></span>
                                </div>
                                <div>
                                    <img class="mypic" src="img/bg_1.jpg">
                                </div>
                                <!--图片底部操作-->
                                <div class="img_oporation">
                                    <span>删除</span>
                                    <span></span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!--管理中心-->
            <div class="tab-pane fade" id="management_center">
                <img class="col-sm-12" src="img/bg.jpg">
            </div>

        </div>

        <!--粉丝关注列表-->
        <div class="tab-content kjc_content_container follow_fans count">
            <!--列表-->
            <div class="tab-pane fade" id="follow_fans">
                <!--左边-->
                <div class="myhomepage_bottom_left pull-left">
                    <!--粉丝关注数量部分-->
                    <div class="row text-center inform">
                        <div class="col-sm-12 my_inform">
                            <div class="col-sm-4 col-xs-4" style="border-right: 1px solid rgba(9,4,4,0.47);">
                                <a href="javascript:void(0)">
                                    <div class="followNumb"><i class="z-num"></i></div>
                                    <div class="">关注</div>
                                </a>
                            </div>
                            <div class="col-sm-4 col-xs-4" style="border-right: 1px solid rgba(9,4,4,0.47);">
                                <a href="#">
                                    <div class="fansNumb"><i class="z-num"></i></div>
                                    <div class="">粉丝</div>
                                </a>
                            </div>
                            <div class="col-sm-4 col-xs-4">
                                <a href="#">
                                    <div class="myMsgNumb"><i class="z-num"></i></div>
                                    <div class="">微校</div>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
                <!--右边-->
                <div class="myhomepage_bottom-right pull-right">


                    <!--容器-->
                    <div class="tab-content kjc_content_container">

                        <!--粉丝或关注的列表-->
                        <div class="tab-pane fade in active">
                            <ul class="col-sm-12" style="background-color: white;padding: 0px">
                                <!--一个li-->
                                <li class="col-sm-6" style="padding: 6px 0px 0px 6px; height: 140px;">
                                    <!--一个-->
                                    <div class="col-sm-12"
                                         style="padding: 16px 0px 0px 14px;height: 100%;background-color: rgba(241,241,241,0.87)">
                                        <!--左边-->
                                        <div class="col-sm-3"
                                             style="line-height: 92px;text-align: center;padding: 0px 6px 0px 0px;">
                                            <a href="#" title="Jack.C">
                                                <img src="img/icon.png" class="kjc_msg_face_img"
                                                     style="border-radius: 50%"
                                                     title="Jack.C">
                                            </a>
                                        </div>
                                        <!--右边-->
                                        <div class="col-sm-9"
                                             style="border-left: solid;border-color: #8c8c8c;border-left-width: 1px;">
                                            <div class="name_title"><span>KateJC</span></div>
                                            <div class="if_followOrFuns"><span>已关注</span></div>
                                            <div class="personal_Brief ">这个是个人简介</div>
                                            <div class="followFuns_operation">这是操作栏</div>
                                        </div>
                                    </div>
                                </li>
                                <!--一个li结束s-->


                                <!--一个li-->
                                <li class="col-sm-6" style="padding: 6px 0px 0px 6px; height: 140px;">
                                    <!--一个-->
                                    <div class="col-sm-12"
                                         style="padding: 16px 0px 0px 14px;height: 100%;background-color: rgba(241,241,241,0.87)">
                                        <!--左边-->
                                        <div class="col-sm-3"
                                             style="line-height: 92px;text-align: center;padding: 0px 6px 0px 0px;">
                                            <a href="#" title="Jack.C">
                                                <img src="img/icon.png" class="kjc_msg_face_img"
                                                     style="border-radius: 50%"
                                                     title="Jack.C">
                                            </a>
                                        </div>
                                        <!--右边-->
                                        <div class="col-sm-9"
                                             style="border-left: solid;border-color: #8c8c8c;border-left-width: 1px;">
                                            <div class="name_title"><span>KateJC</span></div>
                                            <div class="if_followOrFuns"><span>已关注</span></div>
                                            <div class="personal_Brief ">这个是个人简介</div>
                                            <div class="followFuns_operation">这是操作栏</div>
                                        </div>
                                    </div>
                                </li>
                                <!--一个li结束s--><!--一个li-->
                                <li class="col-sm-6" style="padding: 6px 0px 0px 6px; height: 140px;">
                                    <!--一个-->
                                    <div class="col-sm-12"
                                         style="padding: 16px 0px 0px 14px;height: 100%;background-color: rgba(241,241,241,0.87)">
                                        <!--左边-->
                                        <div class="col-sm-3"
                                             style="line-height: 92px;text-align: center;padding: 0px 6px 0px 0px;">
                                            <a href="#" title="Jack.C">
                                                <img src="img/icon.png" class="kjc_msg_face_img"
                                                     style="border-radius: 50%"
                                                     title="Jack.C">
                                            </a>
                                        </div>
                                        <!--右边-->
                                        <div class="col-sm-9"
                                             style="border-left: solid;border-color: #8c8c8c;border-left-width: 1px;">
                                            <div class="name_title"><span>KateJC</span></div>
                                            <div class="if_followOrFuns"><span>已关注</span></div>
                                            <div class="personal_Brief ">这个是个人简介</div>
                                            <div class="followFuns_operation">这是操作栏</div>
                                        </div>
                                    </div>
                                </li>
                                <!--一个li结束s-->
                            </ul>


                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>
</div>
<script>

</script>
<script src="/bysj/jar/js/jquery-3.1.0.js"></script>
<script src="/bysj/jar/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="/bysj/jar/js/bootstrap-select-1.12.4/dist/js/bootstrap-select.js"></script><!--下拉选择列表的js-->
<!--<script src="/bysj/base/js/navigation_bar.js"></script>-->
<script src="/bysj/base/js/show_img.js"></script><!--图片浏览js-->
<script type="text/javascript" src="js/jquery.flexText.js"></script><!--评论的输入框插件-->
<script type="text/javascript" src="js/comment_operation.js"></script><!--评论功能的jsF-->
<script type="text/javascript" src="/bysj/base/js/personal_info_edit.js"></script><!--个人主页信息-->
<script type="text/javascript" src="/bysj/base/js/myStorage.js"></script><!--h5的本地存储-->
<!--<script src="/bysj/base/login_or_register/login-register.js" type="text/javascript"></script>--登录注册-->
<script src="/bysj/base/js/varify_form.js" type="text/javascript"></script><!--验证表单-->
<script src="/bysj/jar/js/layer-v3.1.1/layer/layer.js" type="text/javascript"></script><!--layer-->
<script src="/bysj/base/js/common/init.js" type="text/javascript"></script><!--用户公共的js-->
<script type="text/javascript" src="/bysj/base/fileUpload/imgFileupload.js"></script><!--图片上传-->
<script src="/bysj/base/js/common/msgCommon.js" type="text/javascript"></script><!--帖子操作公共js-->
<script src="/bysj/base/js/common/uitil.js" type="text/javascript"></script><!--公共工具js-->
<script type="text/javascript" src="/bysj/jar/js/jquery.form.js"></script><!--jquery的form表单提交插件-->
<%--上传照片--%>
<script type="text/javascript">
    $(function () {
        var imgFile = new ImgUploadeFiles('.box', function (e) {
            this.init({
                MAX: 1, //限制个数
                MH: 5800, //像素限制高度
                MW: 5900, //像素限制宽度s
                callback: function (arr) {
                    console.log(arr)
                }
            });
        });
    });

</script>
</body>

</html>