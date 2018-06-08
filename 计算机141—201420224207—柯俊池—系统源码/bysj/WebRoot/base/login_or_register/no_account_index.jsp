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
    <title>微校，发现有趣的事</title>
    <link rel="stylesheet" href="/bysj/jar/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/bysj/base/css/style.css">
    <link rel="stylesheet" type="text/css" href="/bysj/jar/js/bootstrap-select-1.12.4/dist/css/bootstrap-select.css">
    <link rel="stylesheet" type="text/css" href="/bysj/base/css/navigation_bar.css">
    <link rel="stylesheet" type="text/css" href="/bysj/base/css/show_img.css">
    <link rel="stylesheet" href="/bysj/base/css/comment_style.css">
    <link rel="stylesheet" href="/bysj/base/css/comment.css">

    <link href="/bysj/base/login_or_register/login-register.css" rel="stylesheet"/>
    <%--<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">--%>


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
            <div class="form-group search">
                <input type="text" class="form-control kjc_search" placeholder="#热门话题#" id="search">
                <i class="glyphicon glyphicon-search btn_search" onclick="searchMsg(this)"></i>
                <!--  <button type="submit" class="btn btn-default">提交</button> -->
            </div>

        </form>

        <div class="collapse navbar-collapse" id="my-navbar-collapse">

            <ul class="nav navbar-nav navbar-right">
                <li><a href="/bysj/base/index.jsp"><i
                        class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;<strong>首页</strong></a></li>

                <li><a href="javascript:void(0)" onclick="openLoginModal();">&nbsp;&nbsp;<strong>登录</strong>&nbsp;</a>
                </li>

                <li><a href="javascript:void(0)"
                       onclick="openRegisterModal();">&nbsp;&nbsp;<strong>注册</strong>&nbsp;</a></li>

            </ul>

        </div>


    </div>
    <hr style="margin: 0;padding: 0;color:#222;width: 100%">
</nav>

<div class="container container_bg">
    <div class="row">
        <!--左边-->
        <div class="col-sm-2 col-xs-12 kjc_item">
            <div class="list-group kjc_item_sort">
                <a href="#" class="list-group-item active"><span
                        class="glyphicon glyphicon-globe"></span>&nbsp;&nbsp;热门</a>
            </div>
        </div>


        <!--中间-->
        <div class="col-sm-7 col-xs-12 my_edit">

            <!--信息分类标签导航栏-->
            <div class="row navigation_bar">
                <ul class="nav nav-pills col-sm-3"><!--id="myTab"-->
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

            <div class="row pageDiv hot" id="hotPage">
                <input class="pageSize" hidden="hidden" value="15">
                <input class="currentPage" hidden="hidden" value="1">
                <input class="total" hidden="hidden" value="">
                <a href="javascript:void(0);"
                   onclick="queryHotMsgList(this)"><span>加载更多</span>&nbsp;<span> > </span></a>
            </div>
        </div>

        <!--右边-->
        <div class="col-sm-3 col-xs-12 part_right">
            <!--登录注册-->

            <!--按钮-->
            <div class="row text-center inform">
                <a href="#"><img src="/bysj/base/img/DefaultFace.jpg"></a>
                <h4 style="font-weight: bold;">您还未登录，请登录</h4>
                <div class="col-sm-12 my_inform">
                    <a class="btn big-login" data-toggle="modal" href="javascript:void(0)"
                       onclick="openLoginModal();"><span style="font-weight: bold;">登&nbsp;录</span></a>
                </div>
                <span class="">还没有微校？<a href="javascript:void(0)"
                                        onclick="openRegisterModal();">立即注册</a></span>
            </div>
            <!--登录注册modal-->
            <div class="modal fade login" id="loginModal" data-backdrop="false"
                 style="background-color: rgba(216,216,216,0.41)"
                 tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-keyboard="true" aria-hidden="true">
                <div class="modal-dialog login animated">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                            </button>
                            <h4 class="modal-title">登录</h4>
                        </div>
                        <!--分类登录的标签-->
                        <div class="row navigation_bar login_bar"
                             style="width: 100%; margin-left: 0px; margin-right: 0px;padding-left: 10px;">
                            <ul class="nav nav-pills"> <!--id="myTab"-->
                                <li class="active">
                                    <a href="#students_and_school_" data-toggle="pill" title="student">大学生登录</a>
                                    <div class="arrow"></div>
                                </li>
                                <li>
                                    <a href="#students_and_school_" data-toggle="pill" title="school">学校官方登录</a>
                                    <div class="arrow"></div>
                                </li>
                                <li>
                                    <a href="#organization_of_school" data-toggle="pill" title="club">社团官方登录</a>
                                    <div class="arrow"></div>
                                </li>
                            </ul>
                        </div>

                        <!--分类注册标签-->
                        <div class="row navigation_bar register_bar"
                             style="width: 100%; margin-left: 0px; margin-right: 0px;padding-left: 10px;">
                            <ul class="nav nav-pills"> <!--id="myTab"-->
                                <li class="active">
                                    <a href="#students_and_school_register" data-toggle="pill" title="student">大学生注册</a>
                                    <div class="arrow"></div>
                                </li>
                                <li>
                                    <a href="#students_and_school_register" data-toggle="pill" title="school">学校官方注册</a>
                                    <div class="arrow"></div>
                                </li>
                                <li>
                                    <a href="#organization_of_school_register" data-toggle="pill"
                                       title="club">社团官方注册</a>
                                    <div class="arrow"></div>
                                </li>
                            </ul>
                        </div>


                        <div class="modal-body">
                            <!--分类登录容器-->
                            <div class="tab-content kjc_content_container login_container">
                                <!--“学生用户登录对应的容器-->
                                <div class="tab-pane fade in active" id="students_and_school_">
                                    <div class="box">
                                        <div class="content" style="width: 100%">
                                            <div class="error"></div>
                                            <div class="form loginBox">
                                                <form class="form-horizontal" role="form">
                                                    <div class="error"></div>
                                                    <div class="form-group select_div school">
                                                        <label class="col-sm-2 control-label none_padding">学校：</label>
                                                        <div class="col-sm-10">
                                                            <select class="selectpicker show-tick form-control"
                                                                    data-live-search="true">
                                                                <option value="">请选择学校</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="error"></div>
                                                    <div class="form-group user_account_div" style="margin-top: 5px;">
                                                        <label class="col-sm-2 control-label none_padding">登录名:</label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control" type="text"
                                                                   placeholder="请输入登录手机号" value="">
                                                        </div>
                                                    </div>
                                                    <div class="error"></div>
                                                    <div class="form-group user_password_div">
                                                        <label for="inputPassword"
                                                               class="col-sm-2 control-label none_padding">密码:</label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control pull-left"
                                                                   type="password"
                                                                   placeholder="请输入密码" value="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-12">
                                                            <input class="btn btn-default btn-login" type="button"
                                                                   value="登录"
                                                                   onclick="loginAjax(this,event)">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--社团官方对应的容器-->
                                <div class="tab-pane fade" id="organization_of_school">
                                    <div class="box">
                                        <div class="content" style="width: 100%">
                                            <div class="error"></div>
                                            <div class="form loginBox">
                                                <form class="form-horizontal" role="form">
                                                    <div class="error"></div>
                                                    <div class="form-group select_div school">
                                                        <label class="col-sm-2 control-label none_padding">学校：</label>
                                                        <div class="col-sm-10">
                                                            <select class="selectpicker show-tick form-control"
                                                                    data-live-search="true"
                                                                    onchange="loasClub(this)">
                                                                <option value="">请选择学校</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="error"></div>
                                                    <div class="form-group select_div club">
                                                        <label class="col-sm-2 control-label none_padding">社团 ：</label>
                                                        <div class="col-sm-10">
                                                            <select class="selectpicker show-tick form-control"
                                                                    data-live-search="true">

                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="error"></div>
                                                    <div class="form-group user_account_div" style="margin-top: 5px;">
                                                        <label class="col-sm-2 control-label none_padding">登录名:</label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control" type="text"
                                                                   placeholder="请输入登录手机号" value="">
                                                        </div>
                                                    </div>
                                                    <div class="error"></div>
                                                    <div class="form-group user_password_div">
                                                        <label for="inputPassword"
                                                               class="col-sm-2 control-label none_padding">密码:</label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control pull-left" id=""
                                                                   type="password"
                                                                   placeholder="请输入密码" value="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-12">
                                                            <input class="btn btn-default btn-login" type="button"
                                                                   value="登录"
                                                                   onclick="loginAjax(this,event)">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--注册盒子-->
                            <div class="tab-content kjc_content_container register_container">
                                <!--“学生用户对应的容器-->
                                <div class="tab-pane fade in active" id="students_and_school_register">
                                    <div class="box">
                                        <div class="content" style="width: 100%">
                                            <div class="error"></div>
                                            <div class="form registerBox">
                                                <form class="form-horizontal" role="form">
                                                    <div class="error"></div>
                                                    <div class="form-group select_div school">
                                                        <label class="col-sm-2 control-label none_padding">学校：</label>
                                                        <div class="col-sm-10">
                                                            <select class="selectpicker show-tick form-control"
                                                                    data-live-search="true">
                                                                <option value="">请选择学校</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="error"></div>
                                                    <div class="form-group user_account_div" style="margin-top: 5px;">
                                                        <label class="col-sm-2 control-label none_padding">登录名:</label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control" id="focusedInput" type="text"
                                                                   placeholder="请输入登录手机号" value="">
                                                        </div>
                                                    </div>
                                                    <div class="error"></div>
                                                    <div class="form-group user_password_div">
                                                        <label for="inputPassword"
                                                               class="col-sm-2 control-label none_padding">密码:</label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control pull-left"
                                                                   type="password"
                                                                   placeholder="请输入密码" value="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-12">
                                                            <input class="btn btn-default btn-register" type="button"
                                                                   value="注册微校" name="commit"
                                                                   onclick="registerAjax(this,event)">
                                                            <!-- <input class="btn btn-default btn-login" type="button"
                                                                    value="注册微校">-->
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--社团官方对应的容器-->
                                <div class="tab-pane" id="organization_of_school_register">
                                    <div class="box">
                                        <div class="content" style="width: 100%">
                                            <div class="error"></div>
                                            <div class="form registerBox">
                                                <form class="form-horizontal" role="form">
                                                    <div class="error"></div>
                                                    <div class="form-group select_div school">
                                                        <label class="col-sm-2 control-label none_padding">学校：</label>
                                                        <div class="col-sm-10">
                                                            <select class="selectpicker show-tick form-control"
                                                                    data-live-search="true">
                                                                <option value="">请选择学校</option>

                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="error"></div>
                                                    <div class="form-group club" style="margin-top: 5px;">
                                                        <label class="col-sm-2 control-label none_padding">社团名:</label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control" type="text"
                                                                   placeholder="请输入社团名称" value="">
                                                        </div>
                                                    </div>
                                                    <div class="error"></div>
                                                    <div class="form-group user_account_div" style="margin-top: 5px;">
                                                        <label class="col-sm-2 control-label none_padding">登录名:</label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control" type="text"
                                                                   placeholder="请输入登录手机号" value="">
                                                        </div>
                                                    </div>
                                                    <div class="error"></div>
                                                    <div class="form-group user_password_div">
                                                        <label for="inputPassword"
                                                               class="col-sm-2 control-label none_padding">密码:</label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control pull-left"
                                                                   type="password"
                                                                   placeholder="请输入密码" value="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-12">
                                                            <input class="btn btn-default btn-register" type="button"
                                                                   value="注册微校" name="commit"
                                                                   onclick="registerAjax(this,event)">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>

                        <div class="division">
                            <div class="line l"></div>
                            <span>或者</span>
                            <div class="line r"></div>
                        </div>
                        <div class="social">
                            <a class="circle github" href="#">
                                <i class="fa fa-github fa-fw"></i>
                            </a>
                            <a id="google_login" class="circle google" href="#">
                                <i class="fa fa-google-plus fa-fw"></i>
                            </a>
                            <a id="facebook_login" class="circle facebook" href="#">
                                <i class="fa fa-facebook fa-fw"></i>
                            </a>
                        </div>

                        <div class="modal-footer">
                            <div class="forgot login-footer">
                            <span>还没有微校？
                                 <a href="javascript: showRegisterForm();">立即注册</a>
                            ?</span>
                            </div>
                            <div class="forgot register-footer" style="display:none">
                                <span>已经有微校账号?</span>
                                <a href="javascript: showLoginForm();">点击登录</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--热点推荐部分-->
            <!-- <div class="row part_hot">
                 <div class="col-sm-12">
                     <a href="#"></a> <span class="pull-left"
                                            style="padding: 10px;font-size:16px;font-weight: bold;">热门话题</span>
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

             </div>-->


        </div>
    </div>


</div>
<script src="/bysj/jar/js/jquery-3.1.0.js"></script>
<script src="/bysj/jar/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="/bysj/base/js/text_area.js"></script>
<script src="/bysj/jar/js/bootstrap-select-1.12.4/dist/js/bootstrap-select.js"></script><!--下拉选择列表的js-->
<!--<script src="/bysj/base/js/navigation_bar.js"></script>-->
<script src="/bysj/base/js/show_img.js"></script><!--图片浏览js-->

<script type="text/javascript" src="../js/jquery.flexText.js"></script><!--评论的输入框插件-->
<script type="text/javascript" src="../js/comment_operation.js"></script><!--评论功能的jsF-->

<script src="/bysj/base/login_or_register/login-register.js" type="text/javascript"></script><!--登录注册 , 未登录-->
<script src="/bysj/base/js/varify_form.js" type="text/javascript"></script><!--验证表单-->
<script type="text/javascript" src="/bysj/base/js/myStorage.js"></script><!--h5的本地存储-->
<script src="/bysj/jar/js/layer-v3.1.1/layer/layer.js" type="text/javascript"></script><!--layer-->
<script src="/bysj/base/js/common/msgCommon.js" type="text/javascript"></script><!--帖子操作公共js-->
<script src="/bysj/base/js/common/uitil.js" type="text/javascript"></script><!--公共工具js-->

</body>

</html>