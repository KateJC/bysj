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
    <title>我的大学微校首页</title>
    <link rel="stylesheet"
          href="/bysj/jar/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/bysj/base/css/style.css">
    <link rel="stylesheet" type="text/css"
          href="/bysj/jar/js/bootstrap-select-1.12.4/dist/css/bootstrap-select.css">
    <link rel="stylesheet" type="text/css"
          href="/bysj/base/css/navigation_bar.css">
    <link rel="stylesheet" type="text/css"
          href="/bysj/base/css/show_img.css">
    <link rel="stylesheet" href="/bysj/base/css/comment_style.css">
    <link rel="stylesheet" href="/bysj/base/css/comment.css">
    <link rel="stylesheet" href="/bysj/base/css/upload.css"><!--图片上传-->
</head>
<body>
<!--顶部导航栏-->
<nav class="navbar  navbar-fixed-top" role="navigation"
     style="background: #e0620d; padding-top: 3px; height: 50px;">
    <div class="container-fluid" style="background: #fff;">
        <div class="navbar-header ">
            <span class="navbar-brand" href="#">大学微校</span>

            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#my-navbar-collapse">
                <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span>
            </button>
        </div>
        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <input type="text" class="form-control kjc_search"
                       placeholder="#热门话题#"> <i
                    class="glyphicon glyphicon-search btn_search" onclick="searchMsg(this)"></i>
                <!--  <button type="submit" class="btn btn-default">提交</button> -->
            </div>

        </form>

        <div class="collapse navbar-collapse" id="my-navbar-collapse">

            <ul class="nav navbar-nav navbar-right">
                <li><a href="/bysj/base/index.jsp"><i
                        class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;<strong>首页</strong></a></li>
               <%-- <li><a target="_blank" href="/bysj/base/fileUpload/index.html"><i
                        class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;<strong>私信</strong>&nbsp;<span
                        class="badge">99+</span></a></li>--%>
                <li id="user_id"><a href="/bysj/base/personal_homepage.jsp"><i
                        class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;<span></span></a></li>

                <li class="dropdown"><a href="#" class="dropdown-toggle"
                                        data-toggle="dropdown"> 设置 <b class="caret"></b>
                </a>
                    <ul class="dropdown-menu">
                        <li><a
                                href="/bysj/base/login_or_register/no_account_index.jsp">登录</a></li>
                        <li><a
                                href="/bysj/base/login_or_register/no_account_index.jsp">注册</a></li>

                    </ul>
                </li>
            </ul>

        </div>


    </div>
    <hr style="margin: 0; padding: 0; color: #222; width: 100%">
</nav>

<div class="container container_bg">
    <div class="row">
        <!--左边-->
        <div class="col-sm-2 col-xs-12 kjc_item">
            <div class="list-group kjc_item_sort" id="kjc_item_sort">
                <a href="/bysj/base/index.jsp" class="list-group-item active">
                    <span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;首页</a>
               <%-- <a href="/bysj/base/myPraised.jsp" class="list-group-item">
                    <span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;我的赞</a>
                <a href="javascript:void(0);" class="list-group-item">
                    <span class="glyphicon glyphicon-star"></span>&nbsp;&nbsp;我的收藏</a>--%>
                <a href="javascript:void(0);" class="list-group-item" onclick="gotoqueryHotMsgList()">
                    <span class="glyphicon glyphicon-globe"></span>&nbsp;&nbsp;热门</a>
                <a href="javascript:void(0);" class="list-group-item"
                   onclick="gotoquerymyfriendMsgList()">&nbsp;&nbsp;好友圈</a>
                <a href="javascript:void(0);" class="list-group-item"
                   onclick="gotoquerymySchoolMsgList()">&nbsp;&nbsp;本校圈</a>
            </div>
            <%--<div class="kjc_friends_group kjc_group_primary row pre-scrollable">
                <a href="#" class="list-group-item">&nbsp;&nbsp;特别关注</a> <a
                    href="#" class="list-group-item">&nbsp;&nbsp;媒体</a> <a href="#"
                                                                           class="list-group-item">&nbsp;&nbsp;高校</a> <a
                    href="#"
                    class="list-group-item">&nbsp;&nbsp;就业</a> <a href="#"
                                                                  class="list-group-item">&nbsp;&nbsp;计算机141</a> <a
                    href="#"
                    class="list-group-item">&nbsp;&nbsp;计算机141</a> <a href="#"
                                                                      class="list-group-item">&nbsp;&nbsp;计算机141</a> <a
                    href="#"
                    class="list-group-item">&nbsp;&nbsp;计算机141</a> <a href="#"
                                                                      class="list-group-item">&nbsp;&nbsp;计算机141</a> <a
                    href="#"
                    class="list-group-item">&nbsp;&nbsp;计算机141</a> <a href="#"
                                                                      class="list-group-item">&nbsp;&nbsp;计算机141</a> <a
                    href="#"
                    class="list-group-item">&nbsp;&nbsp;计算机141</a> <a href="#"
                                                                      class="list-group-item">&nbsp;&nbsp;计算机141</a> <a
                    href="#"
                    class="list-group-item">&nbsp;&nbsp;计算机141</a> <a href="#"
                                                                      class="list-group-item">&nbsp;&nbsp;计算机141</a> <a
                    href="#"
                    class="list-group-item">&nbsp;&nbsp;计算机141</a> <a href="#"
                                                                      class="list-group-item">&nbsp;&nbsp;计算机141</a> <a
                    href="#"
                    class="list-group-item">&nbsp;&nbsp;计算机141</a> <a href="#"
                                                                      class="list-group-item">&nbsp;&nbsp;计算机141</a> <a
                    href="#"
                    class="list-group-item">&nbsp;&nbsp;计算机141</a> <a href="#"
                                                                      class="list-group-item">&nbsp;&nbsp;计算机141</a> <a
                    href="#"
                    class="list-group-item">&nbsp;&nbsp;计算机141</a> <a href="#"
                                                                      class="list-group-item">&nbsp;&nbsp;计算机141</a> <a
                    href="#"
                    class="list-group-item">&nbsp;&nbsp;计算机141</a> <a href="#"
                                                                      class="list-group-item">&nbsp;&nbsp;计算机141</a> <a
                    href="#"
                    class="list-group-item">&nbsp;&nbsp;计算机141</a>
            </div>--%>
        </div>


        <!--中间-->
        <div class="col-sm-7 col-xs-12 my_edit">

            <!--发布编辑文本输入框-->
            <div class="row" id="edit_form">
                <span class="pull-left" style="margin: 15px;">编写新鲜事</span> <span
                    class="tips pull-right" style="margin: 15px;"></span>
                <div style="margin-top: 50px;">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <!--发布帖子的编辑框-->
                            <div contentEditable="true" id="content" class="form-control"
                                 style="overflow: auto; height: expression(( this.scrollHeight &gt; 150)?'150px':(this.scrollHeight +5)+'px');"></div>
                            <!---->
                        </div>
                        <div class="col-sm-12" style="margin-top: 12px;">
                            <span class="emoji">表情</span> <span class="pic">图片 </span>
                            <div class="myEmoji">
                                <!--id="myTab"-->
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#set" data-toggle="tab">
                                        预设 </a></li>
                                    <li><a href="#hot" data-toggle="tab">热门</a></li>
                                </ul>
                                <!---->
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane fade in active" id="set">
                                        <div class="emoji_1"></div>
                                    </div>
                                    <div class="tab-pane fade" id="hot">
                                        <div class="emoji_2"></div>
                                    </div>
                                </div>
                            </div>
                            <select class="selectpicker" id="privilege_select" data-width="auto">
                                <!--这里用到了一个插件bootstrap-select.js-->
                                <option value="public">公开可见</option>
                                <option value="private">仅自己可见</option>
                                <option value="friend">好友可见</option>
                            </select>
                            <select class="selectpicker" id="msgType_select" data-width="auto">
                                <!--这里用到了一个插件bootstrap-select.js-->
                                <option value="default">微校说说</option>
                                <option value="job">就业</option>
                                <option value="club">社团活动</option>
                                <option value="study">学习交流</option>
                            </select>
                            <!-- <span> <input type="file" id="selectImg" value=""></input> </span> -->
                            <button type="button" id="send"
                                    class="btn btn-default pull-right disabled">发布
                            </button>

                            <%----%>
                            <div class="W_layer W_layer_pop display_none layer_upload" id="layer_upload"
                                 style="left: 4px; top: 42px;">
                                <div class="content">
                                    <div class="W_layer_close">
                                        <a href="javascript:void(0)" node-type="close"
                                           class="W_ficon ficon_close S_ficon">X</a>
                                    </div>
                                    <div node-type="inner">
                                        <div class="layer_pic_list clearfix" node-type="box">
                                            <div class="W_layer_con_tit"><h1 class="W_f14 W_fb">本地上传</h1>
                                                <h2 class="clearfix" style="font-size: 13px"><span class="tit_txt W_fl"
                                                                                                   node-type="picsInfo"><em
                                                        class="error_txt">最多选择9张图片上传</em></span>
                                                </h2>
                                            </div>
                                            <form id="img_form"
                                                  method="post"
                                                  enctype="multipart/form-data">
                                                <div class="box">
                                                </div>
                                                <%-- <input type="submit" id="upload_input" value="上传">--%>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%----%>
                        </div>

                    </div>
                </div>
            </div>

            <!--信息分类标签导航栏-->
            <div class="row navigation_bar">
                <ul class="nav nav-pills col-sm-3" id="myTab">
                    <li class="active"><a href="#all" data-toggle="pill">全部</a>
                        <div class="arrow"></div>
                    </li>
                    <li><a href="#my_feelings" data-toggle="pill">微校说说</a>
                        <div class="arrow"></div>
                    </li>
                    <li><a href="#obtain_employment" data-toggle="pill">就业</a>
                        <div class="arrow"></div>
                    </li>
                    <li><a href="#club_activity" data-toggle="pill">社团活动</a>
                        <div class="arrow"></div>
                    </li>
                    <li><a href="#study" data-toggle="pill">学习交流</a>
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

                    <!--一条帖子-->
                    <%-- <div class="row item_msg">
                         <!--一条帖子上面部分-->
                         <div class="col-sm-12 col-xs-12 message kjc_msg">
                             <!--左边头像部分-->
                             <div class="col-sm-2 col-xs-2">
                                 <a href="#" onclick="goToUserMainPage('','')">
                                     <img src="img/icon.png" class="kjc_msg_face_img" title="Jack.C">
                                 </a>
                             </div>
                             <!-- 右边内容部分-->
                             <div class="col-sm-10 col-xs-10 kjc_msg_content">
                                 &lt;%&ndash;右边浮动的操作标签&ndash;%&gt;
                                 <div class="WX_FO">
                                     <div class="screen_box">
                                         <a href="javascript:void(0);"
                                            onclick="show_layer_menu_list(this)">
                                             <span class="glyphicon glyphicon-chevron-down up W_ficon"></span>
                                         </a>
                                         <div class="layer_menu_list">
                                             <ul>
                                                 <li><a href="javascript:void(0)" title="帮上头条">帮上头条</a></li>
                                                 <li><a href="javascript:void(0)" title="屏蔽这条微博">屏蔽这条微博</a></li>
                                                 <li><a href="javascript:void(0)" title="屏蔽 东邪西媚">屏蔽 东邪西媚</a></li>
                                                 <li><a href="javascript:void(0)" title="取消关注东邪西媚">取消关注东邪西媚</a></li>
                                                 <li><a href="javascript:void(0);">举报</a>
                                                 </li>
                                             </ul>
                                         </div>
                                     </div>
                                 </div>
                                 <!--右边的顶上部分-->
                                 <div class="kjc_user_name">
                                          <span>
                                              <a href="#" class="kjc_msg_a kjc_user_a">Jack.C</a>
                                          </span>
                                 </div>
                                 <div class="kjc_msg_info">
                                     <small class="date">
                                         <a href="#" class="kjc_msg_a">1分钟前</a>
                                     </small>
                                     <span>来自
                                          <a href="#" class="kjc_msg_a"
                                             onclick="goToSchoolMainPage(schoolId)">仲恺农业工程学院</a>
                                      </span>
                                 </div>
                                 <!--右边内容部分-->
                                 <div class="msg_content">
                                     <!--文字内容部分 -->
                                     <div class="kjc_msg_words">
                                              <span>happy day!<br>
                                                  这里有很多文字<br>
                                                  超级多<br>
                                                  非非常多
                                              </span>
                                     </div>
                                     <!-- 图片部分-->
                                     <div class="kjc_msg_img">
                                         <ul class="col-sm-8 col-xs-12 xiangce">
                                             <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                 <img class="mypic" src="img/bg_1.jpg">
                                             </li>
                                             <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                 <img class="mypic" src="img/bg_1.jpg">
                                             </li>
                                             <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                 <img class="mypic" src="img/bg_1.jpg">
                                             </li>
                                             <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                 <img class="mypic" src="img/bg_1.jpg">
                                             </li>
                                             <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                 <img class="mypic" src="img/bg_1.jpg">
                                             </li>
                                             <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                 <img class="mypic" src="img/bg_1.jpg">
                                             </li>
                                             <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                 <img class="mypic" src="img/bg_1.jpg">
                                             </li>
                                             <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                 <img class="mypic" src="img/bg_1.jpg">
                                             </li>
                                             <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                 <img class="mypic" src="img/bg_1.jpg">
                                             </li>
                                         </ul>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <!--一条帖子的底部操作栏-->
                         <div class="col-sm-12 col-xs-12 message_bottom">
                             <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                 <a href="javascript:void(0);" class="kjc_msg_operation_a"
                                    onclick="collectThisMsg($msg.id,userId)">
                                     <span class="glyphicon glyphicon-star-empty"></span>&nbsp;&nbsp;收藏&nbsp;
                                 </a>
                             </div>
                             <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                 <a href="#" class="kjc_msg_operation_a" onclick="transpondThisMsg($msg.id,userId)">
                                     <span class="glyphicon glyphicon-share"></span>&nbsp;&nbsp;转发&nbsp;
                                 </a>
                             </div>
                             <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                 <a class="kjc_msg_operation_a kjc_pl_btn" onclick="loadCommentOfMsg($msg.id)">
                                     <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;评论&nbsp;
                                     <i class="z-num">666</i>
                                 </a>
                             </div>
                             <div class="col-sm-3 col-xs-3 kjc_message_operation"
                                  style="border: none">
                                 <a href="javascript:void(0);" class="kjc_msg_operation_a"
                                    onclick="praiseThisMsg($msg.id,userId,this)">
                                     <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;点赞&nbsp;
                                     <i class="z-num">666</i>
                                 </a>
                             </div>
                         </div>
                         <!--一条帖子的评论部分 默认为隐藏起来-->
                         <div class="commentAll col-sm-12 col-xs-12">
                             <!--评论区域 begin-->
                             <div class="reviewArea clearfix">
                                      <textarea class="content comment-input"
                                                placeholder="请输入您的评论，不超过140个字符&hellip;"
                                                onkeyup="keyUP(this)"></textarea>
                                 <a href="javascript:;" class="plBtn" onclick="commentThisMsg($msg.id,this)">评论</a>
                             </div>
                             <!--评论区域 end-->
                             <!--回复区域 begin-->
                             <div class="comment-show">
                                 <div class="comment-show-con clearfix">
                                     <!--评论中的头像-->
                                     <div class="comment-show-con-img pull-left">
                                         <a href="#" title="张三">
                                             <img src="images/header-img-comment_03.png" alt="" title="张三">
                                         </a>
                                         <input value="存放这条评论的用户id"title="存放这条评论的用户的类型" hidden="hidden">
                                     </div>
                                     <!--评论右边部分-->
                                     <div class="comment-show-con-list pull-left clearfix">
                                         <!--上部分用户名和评论内容-->
                                         <div class="pl-text clearfix">
                                             <a href="#" class="comment-size-name">张三 : </a>
                                             <!--用户名-->
                                             <span class="my-pl-con">&nbsp;来啊 造作啊!</span>
                                             <!--评论内容-->
                                         </div>
                                         <!--下面部分时间和操作部分-->
                                         <div class="date-dz">
                                                  <span class="date-dz-left pull-left comment-time">
                                                      2017-5-2 11:11:39
                                                  </span>
                                             <div class="date-dz-right pull-right comment-pl-block">
                                                 <a href="javascript:;" class="removeBlock">删除</a>
                                                 <a href="javascript:;"
                                                    class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                 <span class="pull-left date-dz-line">|</span>
                                                 <a href="javascript:;" class="date-dz-z pull-left">
                                                     <i class="date-dz-z-click-red"></i>赞 ( <i class="z-num">666</i>)
                                                 </a>
                                             </div>
                                         </div>
                                         <div class="hf-list-con"></div>
                                     </div>
                                 </div>
                             </div>
                             <!--回复区域 end-->
                         </div>
                     </div>--%>
                    <!--一条帖子结束-->
                    <!--一条有转发的帖子-->
                    <%-- <div class="row item_msg">
                         <!--一条帖子上面部分-->
                         <div class="col-sm-12 col-xs-12 message kjc_msg">
                             <!--左边头像部分-->
                             <div class="col-sm-2 col-xs-2">
                                 <a href="#" title="Jack.C">
                                     <img src="img/icon.png" class="kjc_msg_face_img" title="Jack.C">
                                 </a>
                             </div>
                             <!-- 右边内容部分-->
                             <div class="col-sm-10 col-xs-10 kjc_msg_content">
                                 &lt;%&ndash;右边浮动的操作标签&ndash;%&gt;
                                 <div class="WX_FO">
                                     <div class="screen_box">
                                         <a href="javascript:void(0);"
                                            onclick="show_layer_menu_list(this)">
                                             <span class="glyphicon glyphicon-chevron-down up W_ficon"></span>
                                         </a>
                                         <div class="layer_menu_list">
                                             <ul>
                                                 <li><a href="javascript:void(0);" title="帮上头条">帮上头条</a></li>
                                                 <li><a href="javascript:void(0);" title="屏蔽这条微博">屏蔽这条微博</a></li>
                                                 <li><a href="javascript:void(0);" title="屏蔽 东邪西媚">屏蔽 东邪西媚</a></li>
                                                 <li><a href="javascript:void(0);" title="取消关注东邪西媚">取消关注东邪西媚</a></li>
                                                 <li><a href="javascript:void(0);">举报</a>
                                                 </li>
                                             </ul>
                                         </div>
                                     </div>
                                 </div>
                                 <!--右边的顶上部分-->
                                 <div class="kjc_user_name">
                                         <span>
                                             <a href="#" class="kjc_msg_a kjc_user_a">Jack.C</a>
                                         </span>
                                 </div>
                                 <div class="kjc_msg_info">
                                     <small class="date">
                                         <a href="#" class="kjc_msg_a">1分钟前</a>
                                     </small>
                                     <span>
                                         来自
                                         <a href="#" class="kjc_msg_a">仲恺农业工程学院</a>
                                     </span>
                                 </div>
                                 <!--右边内容部分-->
                                 <div class="msg_content">
                                     <!--文字内容部分 -->
                                     <div class="kjc_msg_words">
                                             <span>happy day!<br>
                                                 这里有很多文字<br>
                                                 超级多<br>
                                                 非非常多
                                             </span>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         &lt;%&ndash;转发的部分&ndash;%&gt;
                         <div class="col-sm-12 col-xs-12 transponds">
                             <!--左边头像部分-->
                             <div class="col-sm-2 col-xs-2">
                             </div>
                             <!-- 右边内容部分-->
                             <div class="col-sm-10 col-xs-10 kjc_msg_content">
                                 <!--右边的顶上部分-->
                                 <div class="kjc_user_name">
                                     <span>
                                         <a href="#" class="kjc_msg_a kjc_user_a">Jack.C</a>
                                     </span>
                                 </div>
                                 <!--右边内容部分-->
                                 <div class="msg_content">
                                     <!--文字内容部分 -->
                                     <div class="kjc_msg_words">
                                             <span>happy day!<br>
                                                 这里有很多文字<br>
                                                 超级多<br>
                                                 非非常多
                                             </span>
                                     </div>
                                     <!-- 图片部分-->
                                     <div class="kjc_msg_img">
                                         <ul class="col-sm-8 col-xs-12 xiangce">
                                             <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                 <img class="mypic" src="img/bg_1.jpg">
                                             </li>
                                             <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                 <img class="mypic" src="img/bg_1.jpg">
                                             </li>
                                             <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                 <img class="mypic" src="img/bg_1.jpg">
                                             </li>
                                             <li class="col-sm-4 col-xs-4 kjc_msg_img list">
                                                 <img class="mypic" src="img/bg_1.jpg">
                                             </li>
                                         </ul>
                                     </div>
                                     &lt;%&ndash;转发的帖子信息&ndash;%&gt;
                                     <div class="kjc_msg_info">
                                         <small class="date">
                                             <a href="#" class="kjc_msg_a">1分钟前</a>
                                         </small>
                                         <span>
                                         来自<a href="#" class="kjc_msg_a">仲恺农业工程学院</a>
                                         </span>
                                     </div>
                                     <!--一条转发帖子的底部操作栏-->
                                     <div class="message_bottom">
                                         <div class="kjc_message_operation">
                                             <a href="#" class="kjc_msg_operation_a">
                                                 <span class="glyphicon glyphicon-share"></span>
                                                 &nbsp;转发<span class="my_badge">548</span>
                                             </a>
                                         </div>
                                         <div class="kjc_message_operation">
                                             <a class="kjc_msg_operation_a kjc_pl_btn">
                                                 <span class="glyphicon glyphicon-comment"></span>
                                                 &nbsp;评论<span class="my_badge">9959</span>
                                             </a>
                                         </div>
                                         <div class="kjc_message_operation" style="border: none">
                                             <a href="#" class="kjc_msg_operation_a">
                                                 <span class="glyphicon glyphicon-heart-empty"></span>
                                                 &nbsp;点赞<span class="my_badge">9954</span>
                                             </a>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         &lt;%&ndash;转发结束&ndash;%&gt;
                         <!--一条帖子的底部操作栏-->
                         <div class="col-sm-12 col-xs-12 message_bottom">
                             <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                 <a href="#" class="kjc_msg_operation_a">
                                     <span class="glyphicon glyphicon-star-empty"></span>&nbsp;收藏
                                 </a>
                             </div>
                             <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                 <a href="#" class="kjc_msg_operation_a">
                                     <span class="glyphicon glyphicon-share"></span>&nbsp转发
                                     <span class="my_badge">548</span>
                                 </a>
                             </div>
                             <div class="col-sm-3 col-xs-3 kjc_message_operation">
                                 <a class="kjc_msg_operation_a kjc_pl_btn">
                                     <span class="glyphicon glyphicon-comment"></span>&nbsp;评论
                                     <span class="my_badge">9959</span>
                                 </a>
                             </div>
                             <div class="col-sm-3 col-xs-3 kjc_message_operation"
                                  style="border: none">
                                 <a href="#" class="kjc_msg_operation_a">
                                     <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;点赞
                                     <span class="my_badge">9954</span>
                                 </a>
                             </div>
                         </div>
                         <!--一条帖子的评论部分 默认为隐藏起来-->
                         <div class="commentAll col-sm-12 col-xs-12">
                             <!--评论区域 begin-->
                             <div class="reviewArea clearfix">
                                     <textarea class="content comment-input"
                                               placeholder="请输入您的评论，不超过140个字符&hellip;"
                                               onkeyup="keyUP(this)"></textarea>
                                 <a href="javascript:;" class="plBtn">评论</a>
                             </div>
                             <!--评论区域 end-->
                             <!--回复区域 begin-->
                             <div class="comment-show">
                                 <div class="comment-show-con clearfix">
                                     <!--评论中的头像-->
                                     <div class="comment-show-con-img pull-left">
                                         <a href="#" title="张三">
                                             <img src="images/header-img-comment_03.png" alt="" title="张三">
                                         </a>
                                     </div>
                                     <!--评论右边部分-->
                                     <div class="comment-show-con-list pull-left clearfix">
                                         <!--上部分用户名和评论内容-->
                                         <div class="pl-text clearfix">
                                             <a href="#" class="comment-size-name">张三 : </a>
                                             <!--用户名-->
                                             <span class="my-pl-con">&nbsp;来啊 造作啊!</span>
                                             <!--评论内容-->
                                         </div>
                                         <!--下面部分时间和操作部分-->
                                         <div class="date-dz">
                                             <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                             <div class="date-dz-right pull-right comment-pl-block">
                                                 <a href="javascript:void(0);" class="removeBlock">删除</a>
                                                 <a href="javascript:void(0);"
                                                    class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                 <span class="pull-left date-dz-line">|</span>
                                                 <a href="javascript:void(0);" class="date-dz-z pull-left">
                                                     <i class="date-dz-z-click-red"></i>赞 ( <i class="z-num">666</i>)
                                                 </a>
                                             </div>
                                         </div>
                                         <div class="hf-list-con"></div>
                                     </div>
                                 </div>
                             </div>
                             <!--回复区域 end-->
                         </div>
                     </div>--%>
                    <!--一条帖子结束-->
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

            <div class="row pageDiv default" id="page">
                <input class="pageSize" hidden="hidden" value="15">
                <input class="currentPage" hidden="hidden" value="1">
                <input class="total" hidden="hidden" value="">
                <a href="javascript:void(0);"
                   onclick="nextPage(this)"><span>加载更多</span>&nbsp;<span> > </span></a>
            </div>
        </div>

        <!--右边-->
        <div class="col-sm-3 col-xs-12 part_right count">
            <!--头像部分-->
            <div class="row text-center inform">
                <a href="/bysj/base/personal_homepage.jsp" class="User_Account_Img"><img
                        src="img/icon.png"></a>
                <a href="/bysj/base/personal_homepage.jsp" class="User_Account_Img">
                    <h4 style="font-weight: bold;"><span></span></h4></a>
                <div class="col-sm-12 my_inform">
                    <div class="col-sm-4 col-xs-4"
                         style="border-right: 1px solid rgba(9, 4, 4, 0.47);">
                        <a href="#">
                            <div class="followNumb"><i class="z-num"></i></div>
                            <div>关注</div>
                        </a>
                    </div>
                    <div class="col-sm-4 col-xs-4"
                         style="border-right: 1px solid rgba(9, 4, 4, 0.47);">
                        <a href="#">
                            <div class="fansNumb"><i class="z-num"></i></div>
                            <div>粉丝</div>
                        </a>
                    </div>
                    <div class="col-sm-4 col-xs-4">
                        <a href="#">
                            <div class="myMsgNumb"><i class="z-num"></i></div>
                            <div>微校</div>
                        </a>
                    </div>
                </div>
            </div>
            <!--热点推荐部分-->
            <!-- <div class="row part_hot">
                 <div class="col-sm-12">
                     <a href="#"></a> <span class="pull-left"
                                            style="padding: 10px; font-size: 16px; font-weight: bold;">热门话题</span>
                     <a href="#"><span
                             class="glyphicon glyphicon-refresh pull-right"
                             style="padding: 13px 0px 10px 5px;"></span>&nbsp;&nbsp; <span
                             class=" pull-right" style="padding: 10px 0px 10px 0px;">换话题</span></a>
                 </div>
                 <hr style="margin: 0; padding: 0; width: 100%">

                 <div class="col-sm-12 item_hot">
                     <span class="pull-left">#英雄联盟s7#</span> <span
                         class="pull-right item_num">2.6亿</span>
                 </div>

                 <div class="col-sm-12 item_hot">
                     <span class="pull-left">#今天霜降#</span> <span
                         class="pull-right item_num">2.6亿</span>
                 </div>

                 <div class="col-sm-12 item_hot">
                     <span class="pull-left">#亚洲新歌榜#</span> <span
                         class="pull-right item_num">10.4亿</span>
                 </div>

                 <div class="col-sm-12 item_hot">
                     <span class="pull-left">#扑通扑通少女心#</span> <span
                         class="pull-right item_num">1.5亿</span>
                 </div>

                 <div class="col-sm-12 item_hot">
                     <span class="pull-left">#突然开心#</span> <span
                         class="pull-right item_num">1.1亿</span>
                 </div>
                 <hr style="margin: 0; padding: 0; width: 100%">

                 <div class="col-sm-12 text-center" style="padding: 10px">
                     <a href="#">查看更多</a>
                 </div>

             </div>-->


            <!--分组列表的部分名单-->
            <!--  <div class="row group_list">
                  <div class="col-sm-12">
                      <a href="#"><span class="pull-left"
                                        style="padding: 10px; font-size: 16px; font-weight: bold; color: #000000;">特别关注</span></a>
                      <a href="#"><span class="glyphicon glyphicon-cog pull-right"
                                        style="padding: 13px 0px 10px 5px; color: #000000;"></span>&nbsp;&nbsp;
                          <span class=" pull-right" style="padding: 10px 0px 10px 0px;">管理分组</span></a>
                  </div>
                  <hr style="margin: 0; padding: 0; width: 100%">

                  <div class="col-sm-12">
                      <div class="border-bottom clearfix padding_height">
                              <span class="pull-left"><a href="#" title="用户头像"><img
                                      src="img/icon.png" title="用户头像" class="small_ChatHead"></a></span> <span
                              class="pull-left padding_width"><a href="#" title="用户名"><span
                              class="chat_name" title="用户名">和尚洗头用飘柔</span></a></span> <a href="#"
                                                                                         title="从此分组移除该用户"><span
                              class="pull-right item_num right_removeBlock">删除</span></a>
                      </div>
                  </div>

                  <div class="col-sm-12">
                      <div class="border-bottom clearfix padding_height">
                              <span class="pull-left"><a href="#" title="用户头像"><img
                                      src="img/icon.png" title="用户头像" class="small_ChatHead"></a></span> <span
                              class="pull-left padding_width"><a href="#" title="用户名"><span
                              class="chat_name" title="用户名">和尚洗头用飘柔</span></a></span> <a href="#"
                                                                                         title="从此分组移除该用户"><span
                              class="pull-right item_num right_removeBlock">删除</span></a>
                      </div>
                  </div>

                  <div class="col-sm-12">
                      <div class="border-bottom clearfix padding_height">
                              <span class="pull-left"><a href="#" title="用户头像"><img
                                      src="img/icon.png" title="用户头像" class="small_ChatHead"></a></span> <span
                              class="pull-left padding_width"><a href="#" title="用户名"><span
                              class="chat_name" title="用户名">和尚洗头用飘柔</span></a></span> <a href="#"
                                                                                         title="从此分组移除该用户"><span
                              class="pull-right item_num right_removeBlock">删除</span></a>
                      </div>
                  </div>

                  <div class="col-sm-12">
                      <div class="border-bottom clearfix padding_height">
                              <span class="pull-left"><a href="#" title="用户头像"><img
                                      src="img/icon.png" title="用户头像" class="small_ChatHead"></a></span> <span
                              class="pull-left padding_width"><a href="#" title="用户名"><span
                              class="chat_name" title="用户名">和尚洗头用飘柔</span></a></span> <a href="#"
                                                                                         title="从此分组移除该用户"><span
                              class="pull-right item_num right_removeBlock">删除</span></a>
                      </div>
                  </div>

                  <div class="col-sm-12">
                      <div class="border-bottom clearfix padding_height">
                              <span class="pull-left"><a href="#" title="用户头像"><img
                                      src="img/icon.png" title="用户头像" class="small_ChatHead"></a></span> <span
                              class="pull-left padding_width"><a href="#" title="用户名"><span
                              class="chat_name" title="用户名">和尚洗头用飘柔</span></a></span> <a href="#"
                                                                                         title="从此分组移除该用户"><span
                              class="pull-right item_num right_removeBlock">删除</span></a>
                      </div>
                  </div>


                  <hr style="margin: 0; padding: 0; width: 100%">

                  <div class="col-sm-12 text-center" style="padding: 10px">
                      <a href="#">查看更多</a>
                  </div>

              </div>-->

        </div>


        <!--转发modal-->
        <div class="modal fade transpond" id="transpondModal" data-backdrop="false"
             style="background-color: rgba(216,216,216,0.41)"
             tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-keyboard="true" aria-hidden="true">
            <input value="" hidden="hidden" id="fatherId">
            <div class="modal-dialog transpond animated" style="width: 682px;">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                        </button>
                        <h4 class="modal-title">转发帖子</h4>
                    </div>

                    <div class="modal-body">

                        <!--发布编辑文本输入框-->
                        <div class="row" id="transpond_edit_form">
                            <span class="pull-left" style="margin:0px 15px 0px 15px;">编写转发的感想</span> <span
                                class="tips pull-right" style="margin: 0px 15px 0px 15px;"></span>
                            <div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <!--发布帖子的编辑框-->
                                        <div contentEditable="true" id="transpond_content" class="form-control"
                                             style="overflow: auto; height: expression(( this.scrollHeight &gt; 150)?'150px':(this.scrollHeight +5)+'px');"></div>
                                        <!---->
                                    </div>
                                    <div class="col-sm-12" style="margin-top: 12px;">
                                        <span class="transpond_emoji">表情</span> <span class="transpond_pic">图片 </span>
                                        <div class="transpond_myEmoji">
                                            <!--id="myTab"-->
                                            <ul class="nav nav-tabs">
                                                <li class="active"><a href="#transpond_set" data-toggle="tab">
                                                    预设 </a></li>
                                                <li><a href="#transpond_hot" data-toggle="tab">热门</a></li>
                                            </ul>
                                            <!---->
                                            <div id="transpond_myTabContent" class="tab-content">
                                                <div class="tab-pane fade in active" id="transpond_set">
                                                    <div class="emoji_1"></div>
                                                </div>
                                                <div class="tab-pane fade" id="transpond_hot">
                                                    <div class="emoji_2"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <select class="selectpicker" id="transpond_privilege_select" data-width="auto">
                                            <!--这里用到了一个插件bootstrap-select.js-->
                                            <option value="public">公开可见</option>
                                            <option value="private">仅自己可见</option>
                                            <option value="friend">好友可见</option>
                                        </select>
                                        <select class="selectpicker" id="transpond_msgType_select" data-width="auto">
                                            <!--这里用到了一个插件bootstrap-select.js-->
                                            <option value="default">微校说说</option>
                                            <option value="job">就业</option>
                                            <option value="club">社团活动</option>
                                            <option value="study">学习交流</option>
                                        </select>
                                        <!-- <span> <input type="file" id="selectImg" value=""></input> </span> -->
                                        <button type="button" id="transpond_send"
                                                class="btn btn-default pull-right disabled">发布
                                        </button>

                                        <%----%>
                                        <div class="W_layer W_layer_pop display_none layer_upload"
                                             id="transpond_layer_upload"
                                             style="left: 4px; top: 42px;">
                                            <div class="content">
                                                <div class="W_layer_close">
                                                    <a href="javascript:void(0)" node-type="close"
                                                       class="W_ficon ficon_close S_ficon">X</a>
                                                </div>
                                                <div node-type="inner">
                                                    <div class="layer_pic_list clearfix" node-type="box">
                                                        <div class="W_layer_con_tit"><h1 class="W_f14 W_fb">本地上传</h1>
                                                            <h2 class="clearfix" style="font-size: 13px"><span
                                                                    class="tit_txt W_fl"
                                                                    node-type="picsInfo"><em
                                                                    class="error_txt">最多选择9张图片上传</em></span>
                                                            </h2>
                                                        </div>
                                                        <form id="transpond_img_form"
                                                              method="post"
                                                              enctype="multipart/form-data">
                                                            <div class="box">
                                                            </div>
                                                        </form>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%----%>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="/bysj/jar/js/jquery-3.1.0.js"></script>
<script src="/bysj/jar/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="/bysj/base/js/text_area.js"></script>
<script src="/bysj/jar/js/bootstrap-select-1.12.4/dist/js/bootstrap-select.js"></script>
<!--下拉选择列表的js-->
<!--<script src="/bysj/base/js/navigation_bar.js"></script>-->
<script src="/bysj/base/js/show_img.js"></script><!--图片浏览js-->
<script type="text/javascript" src="js/jquery.flexText.js"></script><!--评论的输入框插件-->
<script type="text/javascript" src="js/comment_operation.js"></script><!--评论功能的js-->
<script type="text/javascript" src="/bysj/base/js/myStorage.js"></script><!--h5的本地存储-->
<script src="/bysj/jar/js/layer-v3.1.1/layer/layer.js" type="text/javascript"></script><!--layer-->
<script src="/bysj/base/js/index.js" type="text/javascript"></script><!--用户首页的技术js-->
<script src="/bysj/base/js/common/init.js" type="text/javascript"></script><!--用户公共的js-->
<script src="/bysj/base/js/varify_form.js" type="text/javascript"></script><!--验证表单-->
<script src="/bysj/base/js/common/uitil.js" type="text/javascript"></script><!--公共工具js-->
<script src="/bysj/base/js/common/msgCommon.js" type="text/javascript"></script><!--帖子操作公共js-->
<script type="text/javascript" src="/bysj/base/fileUpload/imgFileupload.js"></script><!--图片上传-->
<script type="text/javascript" src="/bysj/jar/js/jquery.form.js"></script><!--jquery的form表单提交插件-->

<%--上传照片--%>
<script type="text/javascript">
    $(function () {
        var imgFile = new ImgUploadeFiles('.box', function (e) {
            this.init({
                MAX: 9, //限制个数
                MH: 5800, //像素限制高度
                MW: 5900, //像素限制宽度
                callback: function (arr) {
                    console.log(arr)
                }
            });
        });
        var imgFile = new ImgUploadeFiles('#transpond_layer_upload .box', function (e) {
            this.init({
                MAX: 9, //限制个数
                MH: 5800, //像素限制高度
                MW: 5900, //像素限制宽度
                callback: function (arr) {
                    console.log(arr)
                }
            });
        });


    });

</script>
</body>

</html>