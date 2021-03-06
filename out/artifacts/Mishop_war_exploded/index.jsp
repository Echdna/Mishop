<%--
  Created by IntelliJ IDEA.
  User: Simon
  Date: 2020/2/10
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>首页-小米商城</title>
    <link rel="stylesheet" href="css/xiaomi.css"/>
    <script type="text/javascript" src="./js/jquery-2.1.4.min.js"></script>
    <script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/2.1.4/jquery.min.js"></script>
    <style>
        .gouwuches {
            background: #ff6700;
        }

        .gouwuches:hover{
            background: darkgrey;
        }

    </style>
</head>
<body>
<div class="head_box">
    <div id="head_wrap">
        <div id="head_nav">
            <a class="head_nav_a">大米网</a>
            <span>|</span>
            <a class="head_nav_a">MIUI</a>
            <span>|</span>
            <a class="head_nav_a">米聊</a>
            <span>|</span>
            <a class="head_nav_a">游戏</a>
            <span>|</span>
            <a class="head_nav_a">多看阅读</a>
            <span>|</span>
            <a class="head_nav_a">云服务</a>
            <span>|</span>
            <a class="head_nav_a">大米移动版</a>
            <span>|</span>
            <a class="head_nav_a">问题反馈</a>
            <span>|</span>
            <a class="head_nav_a" id="Select_Region_but">Select Region</a>
        </div>
        <div id="head_right">
            <div id="head_landing">
                <c:if test="${empty user}">
                    <a href="${pageContext.request.contextPath}/login.jsp" style="color:lightgray"
                        class="login" target="_self">[登录]</a>
                    <span style="color:white">|</span>
                    <a href="${pageContext.request.contextPath}/register.jsp" style="color:lightgray"
                    class="register" target="_self">[注册]</a>
                </c:if>
                <c:if test="${!empty user }">
                    <a style="color:white" href="./self_info.jsp">欢迎您，${user.name}</a>
                    <a style="color:red"
                       href="${pageContext.request.contextPath}/logout.jsp">[安全退出]</a>
                </c:if>
            </div>
            <div id="head_car">
                <div class="gouwuches">
                    <a style="color: white;font-size: 13px" href="./gouwuche.jsp" target="_blank">购物车</a>
                </div>

            </div>
        </div>
    </div>
</div>

<div id="main_head_box">
    <div id="menu_wrap">
        <div id="menu_logo">
            <img src="img/xiaomi_logo.png">
        </div>
        <div id="menu_nav">
            <ul>
                <li class="menu_li" control="xiaomiphone">
                    <a style="color: black;" href="search?cid=1">大米手机</a>
                </li>
                <li class="menu_li" control="hongmiphone">
                    <a style="color: black;" href="search?cid=2">红米</a>
                </li>
                <li class="menu_li" control="pingban">
                    <a style="color: black;" href="search?cid=3">平板</a>
                </li>
                <li class="menu_li" control="tv">
                    <a style="color: black;" href="search?cid=4">电视&盒子</a>
                </li>
                <li class="menu_li" control="luyou">
                    <a style="color: black;" href="search?cid=6">路由器</a>
                </li>
                <li class="menu_li" control="yingjian">
                    <a style="color: black;" href="search?cid=8">智能硬件</a>
                </li>
                <li><a>服务</a></li>
                <li><a>社区</a></li>
            </ul>
        </div>

        <div id="find_wrap">
            <div id="find_bar">
                <input type="text" id="find_input" name="name" id="searchName" autocomplete="off"
                       class="shuru" placeholder="小米6&nbsp;小米MIX现货">
            </div>
            <div id="find_but" onclick="getByName()">
                <%--<input type="button" class="sousuo" onclick="getByName()" value="搜索"/>--%>
                GO
            </div>
        </div>

    </div>
</div>

    <%--这里是提供给用户选择用的--%>
    <div id="context1" style="
              height:130px;
              display:none ;
              width:250px;
              background-color:white;
              position:absolute;
              overflow:scroll;
              right: 203px;
              top: 116px;
              z-index:100;
              border: 1px #ccc solid">
    </div>

<div id="menu_content_bg" style="height: 0px;">
    <div id="menu_content_wrap">
        <ul style="top: 0px;">
            <li id="xiaomiphone">
                <div class="menu_content">
                    <img src="img/mi4!160x110.jpg">
                    <p class="menu_content_tit">大米手机4</p>
                    <p class="menu_content_price">1499元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/minote!160x110.jpg">
                    <p class="menu_content_tit">大米NOTE标准版</p>
                    <p class="menu_content_price">1999元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/minotepro!160x110.jpg">
                    <p class="menu_content_tit">大米NOTE顶配版</p>
                    <p class="menu_content_price">2999元起</p>
                </div>
            </li>
            <li id="hongmiphone">
                <div class="menu_content">
                    <img src="img/hongmi2a!160x110.jpg">
                    <p class="menu_content_tit">红米手机2A</p>
                    <p class="menu_content_price">499元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/hongmi2!160x110.jpg">
                    <p class="menu_content_tit">红米手机2</p>
                    <p class="menu_content_price">599元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/note!160x110.jpg">
                    <p class="menu_content_tit">红米NOTE</p>
                    <p class="menu_content_price">699元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/note2!160x110.jpg">
                    <p class="menu_content_tit">红米NOTE2</p>
                    <p class="menu_content_price">799元</p>
                </div>
            </li>
            <li id="pingban">
                <div class="menu_content">
                    <img src="img/mipad16!160x110.jpg">
                    <p class="menu_content_tit">大米平板16G</p>
                    <p class="menu_content_price">1299元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/mipad64!160x110.jpg">
                    <p class="menu_content_tit">大米平板64G</p>
                    <p class="menu_content_price">1499元起</p>
                </div>
            </li>
            <li id="tv">
                <div class="menu_content">
                    <img src="img/mitv40!160x110.jpg">
                    <p class="menu_content_tit">大米电视2&nbsp;40英寸</p>
                    <p class="menu_content_price">1999元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/mitv48!160x110.jpg">
                    <p class="menu_content_tit">大米电视2S&nbsp;48英寸</p>
                    <p class="menu_content_price">2999元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/mitv49!160x110.jpg">
                    <p class="menu_content_tit">大米电视2&nbsp;49英寸</p>
                    <p class="menu_content_price">3399元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/mitv55!160x110.jpg">
                    <p class="menu_content_tit">大米电视2&nbsp;55英寸</p>
                    <p class="menu_content_price">4499元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/hezimini!160x110.jpg">
                    <p class="menu_content_tit">大米盒子MINI版</p>
                    <p class="menu_content_price">199元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/hezis!160x110.jpg">
                    <p class="menu_content_tit">大米盒子增强版</p>
                    <p class="menu_content_price">299元</p>
                </div>
            </li>
            <li id="luyou">
                <div class="menu_content">
                    <img src="img/miwifi!160x110.jpg">
                    <p class="menu_content_tit">全新大米路由器</p>
                    <p class="menu_content_price">699元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/miwifimini!160x110.jpg">
                    <p class="menu_content_tit">大米路由器&nbsp;MINI</p>
                    <p class="menu_content_price">129元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/miwifilite!160x110.jpg">
                    <p class="menu_content_tit">大米路由器&nbsp;青春版</p>
                    <p class="menu_content_price">79元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/wifiExtension!160x110.jpg">
                    <p class="menu_content_tit">大米WIFI放大器</p>
                    <p class="menu_content_price">39元</p>
                </div>
            </li>
            <li id="yingjian">
                <div class="menu_content">
                    <img src="http://c1.mifile.cn/f/i/15/goods/nav/scale!160x110.jpg">
                    <p class="menu_content_tit">体重称</p>
                    <p class="menu_content_price">99元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/xiaoyi!160x110.jpg">
                    <p class="menu_content_tit">摄像头</p>
                    <p class="menu_content_price">129元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/yicamera!160x110.jpg">
                    <p class="menu_content_tit">运动相机</p>
                    <p class="menu_content_price">399元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/ihealth!160x110.jpg">
                    <p class="menu_content_tit">血压计</p>
                    <p class="menu_content_price">199元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/chazuo!160x110.jpg">
                    <p class="menu_content_tit">智能插座</p>
                    <p class="menu_content_price">59元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="img/smart!160x110.jpg">
                    <p class="menu_content_tit">查看全部
                        <br>智能硬件</p>
                </div>
            </li>
        </ul>
    </div>
</div>

<div id="big_banner_wrap">
    <ul id="banner_menu_wrap">
        <li class="active"img>
            <a href="search?cid=1">手机&nbsp;平板</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 600px; top: -20px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a href="findById?id=1" target="_blank"><img src="img/minote.jpg"></a>
                        <a href="findById?id=1" target="_blank">大米NOTE</a>
                        <span>精选</span>
                    </li>
                    <li>
                        <a href="findById?id=2">
                            <img src="img/mi4.jpg">
                        </a>
                        <a href="findById?id=2">大米手机4</a>
                        <span>精选</span>
                    </li>
                    <li>
                        <a href="findById?id=3">
                            <img src="img/hongmi2.jpg">
                        </a>
                        <a href="findById?id=3">红米手机2</a>
                        <span>精选</span>
                    </li>
                    <li>
                        <a href="findById?id=4">
                            <img src="img/hongmi2a.jpg">
                        </a>
                        <a href="findById?id=4">红米手机2A</a>
                        <span>精选</span>
                    </li>
                    <li>
                        <a href="findById?id=5">
                            <img src="img/note2.jpg">
                        </a>
                        <a href="findById?id=5">红米NOTE2</a>
                        <span>精选</span>
                    </li>
                    <li>
                        <a href="findById?id=6">
                            <img src="img/note2.jpg"></a>
                        <a href="findById?id=6">红米NOTE&nbsp;4G双卡</a>
                        <span>精选</span>
                    </li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a href="findById?id=7">
                            <img src="img/mipad.jpg">
                        </a>
                        <a href="findById?id=7">大米平板</a>
                        <span>精选</span>
                    </li>
                    <li>
                        <a href="findById?id=8">
                            <img src="img/telcom.jpg"></a>
                        <a href="findById?id=8">电信版</a>
                    </li>
                    <li>
                        <a href="findById?id=9"><img src="img/heyue.jpg"></a>
                        <a href="findById?id=9">合约机</a>
                    </li>
                    <li>
                        <a href="findById?id=10"><img src="img/zhongxin.jpg"></a>
                        <a href="findById?id=10">中信特权</a>
                    </li>
                    <li>
                        <a href="findById?id=11"><img src="img/compare.jpg"></a>
                        <a href="findById?id=11">对比手机</a>
                    </li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=2">电视&nbsp;盒子</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 600px; top: -62px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/tv40.jpg"></a><a>大米电视40英寸</a></li>
                    <li>
                        <a><img src="img/tv48.jpg"></a><a>大米电视48英寸</a></li>
                    <li>
                        <a><img src="img/tv49.jpg"></a><a>大米电视49英寸</a></li>
                    <li>
                        <a><img src="img/hezis.jpg"></a><a>大米电视55英寸</a></li>
                    <li>
                    <li>
                        <a><img src="img/hezis.jpg"></a><a>大米盒子MINI</a></li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/dianshipeijian.jpg"></a><a>大米电视配件</a><span>精选</span>
                    </li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=3">路由器&nbsp;智能配件</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 900px; top: -104px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/miwifi.jpg"></a><a>大米路由器</a></li>
                    <li>
                        <a><img src="img/miwifilite.jpg"></a><a>大米路由器&nbsp; 青春版</a></li>
                    <li>
                        <a><img src="img/air.jpg"></a><a>净化器</a></li>
                    <li>
                        <a><img src="img/xiaoyi.jpg"></a><a>摄像机</a></li>
                    <li>
                        <a><img src="img/scale.jpg"></a><a>体重称</a></li>
                    <li>
                        <a><img src="img/scale.jpg"></a><a>智能插头</a></li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/miwifimini.jpg"></a><a>大米路由器MINI</a></li>
                    <li>
                        <a><img src="img/wifiExtension.jpg"></a><a>大米WIFI放大器</a></li>
                    <li>
                        <a><img src="img/yicamera.jpg"></a><a>运动相机</a></li>
                    <li>
                        <a><img src="img/water.jpg"></a><a>净水器</a></li>
                    <li>
                        <a><img src="img/ihealth.jpg"></a><a>血压计</a></li>
                    <li>
                        <a><img src="img/ihealth.jpg"></a><a>床头灯</a></li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/zhinengtaozhuang.jpg"></a><a>智能家庭套装</a></li>
                    <li>
                        <a><img src="img/shouhuan.jpg"></a><a>大米手环</a></li>
                    <li>
                        <a><img src="img/smart.jpg"></a><a>全部智能硬件</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=4">移动电源&nbsp;插线板</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -146px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/dianyuan.jpg "></a><a>大米移动电源</a></li>
                    <li>
                        <a><img src="img/powerscript.jpg"></a><a>大米插线板</a></li>
                    <li>
                        <a><img src="img/yidongdianyuan.jpg"></a><a>品牌移动电源</a></li>
                    <li>
                        <a><img src="img/dianyuanfujian.jpg"></a><a>移动电源附件</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=5">耳机&nbsp;音箱</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -188px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/headphone.jpg"></a><a>大米头戴式耳机</a></li>
                    <li>
                        <a><img src="img/huosai.jpg"></a><a>大米活塞耳机</a></li>
                    <li>
                        <a><img src="img/bluetoothheadset.jpg"></a><a>大米蓝牙耳机</a></li>
                    <li>
                        <a><img src="img/erji.jpg"></a><a>品牌耳机</a></li>
                    <li>
                        <a><img src="img/yinxiang.jpg"></a><a>音箱</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=6">电池&nbsp;存储卡</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -230px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/dianchi.jpg"></a><a>电池</a></li>
                    <li>
                        <a><img src="img/chongdian.jpg"></a><a>充电器</a></li>
                    <li>
                        <a><img src="img/xiancai.jpg"></a><a>线材</a></li>
                    <li>
                        <a><img src="img/cunchu.jpg"></a><a>存储卡</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=8">保护套&nbsp;后盖</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -272px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/baohu.jpg"></a><a>保护套/保护壳</a></li>
                    <li>
                        <a><img src="img/hougai.jpg"></a><a>后盖</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=1">贴膜&nbsp;其它配件</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 600px; top: -314px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/tiemo.jpg"></a><a>贴膜</a></li>
                    <li>
                        <a><img src="img/zipaigan.jpg"></a><a>自拍杆</a></li>
                    <li>
                        <a><img src="img/zipaigan.jpg"></a><a>蓝牙手柄</a></li>
                    <li>
                        <a><img src="img/tizhi.jpg"></a><a>贴纸</a></li>
                    <li>
                        <a><img src="img/fangchensai.jpg"></a><a>防尘塞</a></li>
                    <li>
                        <a><img src="img/fangchensai.jpg"></a><a>手机支架</a></li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/raoxian.jpg"></a><a>耳机绕线器</a></li>
                    <li>
                        <a><img src="img/wifi.jpg"></a><a>随身WIFI</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=3">米兔&nbsp;服装</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -356px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/mitu.jpg"></a><a>米兔</a></li>
                    <li>
                        <a><img src="img/fuzhuang.jpg"></a><a>服装</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=2">背包&nbsp;其它周边</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -398px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/bag.jpg"></a><a>背包</a></li>
                    <li>
                        <a><img src="img/shubiaodian.jpg"></a><a>大米鼠标坠</a></li>
                    <li>
                        <a><img src="img/zhoubian.jpg"></a><a>生活周边</a></li>
                    <li>
                        <a><img src="img/wan.jpg"></a><a>玩酷产品</a></li>
                </ul>
            </div>
        </li>
    </ul>
    <div id="big_banner_pic_wrap">
        <ul id="big_banner_pic">
            <li><img src="img/T1hiDvBvVv1RXrhCrK.jpg"></li>
            <li><img src="img/T1jrxjB_VT1RXrhCrK.jpg"></li>
            <li><img src="img/T1oTJjBKKT1RXrhCrK.jpg"></li>
            <li><img src="img/T1RICjB7DT1RXrhCrK.jpg"></li>
            <li><img src="img/T1vWdTBKDv1RXrhCrK.jpg"></li>
        </ul>
    </div>
    <div id="big_banner_change_wrap">
        <div id="big_banner_change_prev"> &lt;</div>
        <div id="big_banner_change_next">&gt;</div>
    </div>
</div>
<div id="head_other_wrap">
    <div id="head_other">
        <ul>
            <li>
                <div id="div1">
                    <p>START</p>
                    <p>开房购买</p>
                </div>
            </li>
            <li>
                <div id="div2">
                    <p>GROUND</p>
                    <p>企业团购</p>
                </div>
            </li>
            <li>
                <div id="div3">
                    <p>RETROFIT</p>
                    <p>官方产品</p>
                </div>
            </li>
            <li>
                <div id="div4">
                    <p>CHANNEL</p>
                    <p>F码通道</p>
                </div>
            </li>
            <li>
                <div id="div5">
                    <p>RECHARGE</p>
                    <p>话费充值</p>
                </div>
            </li>
            <li>
                <div id="div6">
                    <p>SECURITY</p>
                    <p>防伪检查</p>
                </div>
            </li>
        </ul>
    </div>
    <div class="head_other_ad"><img src="img/T184E_BQWT1RXrhCrK.jpg"></div>
    <div class="head_other_ad"><img src="img/T1yvd_BQDT1RXrhCrK.jpg"></div>
    <div class="head_other_ad"><img src="img/T1mahQBmKT1RXrhCrK.jpg"></div>
</div>
<div id="head_hot_goods_wrap">
    <div id="head_hot_goods_title">
        <span class="title_span">大米明星单品</span>
        <div id="head_hot_goods_change">
            <span id="head_hot_goods_prave"><</span>
            <span id="head_hot_goods_next">></span>
        </div>
    </div>
    <div id="head_hot_goods_content">
        <ul>
            <li>
                <a><img src="img/T1riKjB7VT1RXrhCrK.jpg"></a>
                <a>大米电视2/2S 全系列</a>
                <a>40/48/49/55英寸 现货购买</a>
            </li>
            <li>
                <a><img src="img/T19AbjBCDT1RXrhCrK.jpg"></a>
                <a>大米平板</a>
                <a>全球首款 NVIDIA Tegra K1 平板</a>
            </li>
            <li>
                <a><img src="img/T1meZjBCAT1RXrhCrK.jpg"></a>
                <a>大米盒子增强版 1G</a>
                <a>首款4K超高清网络机顶盒</a>
            </li>
            <li>
                <a><img src="img/T1tsEgB7DT1RXrhCrK.jpg"></a>
                <a>全新大米路由器</a>
                <a>顶配路由器，企业级性能</a>
            </li>
            <li>
                <a><img src="img/T10TJjB5hT1RXrhCrK.jpg"></a>
                <a>大米头戴式耳机</a>
                <a>媲美主流千元级头戴耳机</a>
            </li>
            <li>
                <a><img src="img/T1hLhjB_AT1RXrhCrK.jpg"></a>
                <a>大米插线板</a>
                <a>3重安全保护，插线板中的艺术品</a>
            </li>
            <li>
                <a><img src="img/T1KDAjBCAT1RXrhCrK.jpg"></a>
                <a>大米路由器mini</a>
                <a>主流双频AC智能路由器</a>
            </li>
            <li>
                <a><img src="img/T16eEjBKhT1RXrhCrK.jpg"></a>
                <a>大米移动电源10000mAh</a>
                <a>高密度进口电芯，仅名片大小</a>
            </li>
            <li>
                <a><img src="img/T1JnWjBCCT1RXrhCrK.jpg"></a>
                <a>大米蓝牙耳机</a>
                <a>2015德国IF大奖，高清通话音质</a>
            </li>
            <li>
                <a><img src="img/T1BsbjBvLT1RXrhCrK.jpg"></a>
                <a>大米活塞耳机</a>
                <a>2015红点奖，独家音质优化专利</a>
            </li>
        </ul>
    </div>
</div>
<div id="main_show_box">
    <div id="floor_1">
        <div id="floor_head">
            <span class="title_span">智能硬件</span>
        </div>
    </div>
    <div class="floor_goods_wrap">
        <ul>
            <li class="floor_goods_wrap_li">
                <a><img src="img/T1IhLjBC_T1RXrhCrK.jpg"></a>
            </li>
            <li class="floor_goods_wrap_li">
                <a class="floor_goods_img"><img src="img/T1odEjB5bT1RXrhCrK.jpg"></a>
                <a class="floor_goods_tit">大米智能家庭套装</a>
                <a class="floor_goods_txt">3分钟快速安装，30多种智能玩法</a>
                <a class="floor_goods_price">199元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a class="floor_goods_img"><img src="img/T1JKxvBXhv1RXrhCrK.jpg"></a>
                <a class="floor_goods_tit">大米随身WIFI 8GB U盘版</a>
                <a class="floor_goods_txt">随身上网神器，内置8GB U盘</a>
                <a class="floor_goods_price">49.9元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a class="floor_goods_img"><img src="img/T18yZQBCET1RXrhCrK.jpg"></a>
                <a class="floor_goods_tit">小蚁智能摄像机</a>
                <a class="floor_goods_txt">能看能听能说，手机远程观看</a>
                <a class="floor_goods_price">149元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a class="floor_goods_img"><img src="img/T1YoZQByYT1RXrhCrK.jpg"></a>
                <a class="floor_goods_tit">大米体重称</a>
                <a class="floor_goods_txt">高精度压力传感器 ｜ 手机管理全家健康</a>
                <a class="floor_goods_price">99元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a class="floor_goods_img"><img src="img/T16nVjBCKT1RXrhCrK.jpg"></a>
                <a class="floor_goods_tit">小蚁运动机</a>
                <a class="floor_goods_txt">边玩边录边拍，手机随时分享</a>
                <a class="floor_goods_price">399元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a class="floor_goods_img"><img src="img/T18zWQB4WT1RXrhCrK.jpg"></a>
                <a class="floor_goods_tit">大米路由器 mini</a>
                <a class="floor_goods_txt">主流双频AC智能路由器，性价比之王</a>
                <a class="floor_goods_price">129元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a class="floor_goods_img"><img src="img/T1oixjB5bT1RXrhCrK.jpg"></a>
                <a class="floor_goods_tit">大米智能插座</a>
                <a class="floor_goods_txt">手机远程遥控开关，带USB接口</a>
                <a class="floor_goods_price">59元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a class="floor_goods_img"><img src="img/T1KzbQBvbT1RXrhCrK.jpg"></a>
                <a class="floor_goods_tit">大米水质TDS检测笔</a>
                <a class="floor_goods_txt">准确检测家中水质纯度</a>
                <a class="floor_goods_price">39元</a>
            </li>
            <div style="clear:both;"></div>
        </ul>
    </div>
</div>
<div id="foot_box">
    <div id="foot_wrap">
        <div class="foot_top">
            <ul>
                <li>1小时快修服务</li>
                <li class="font_top_i">|</li>
                <li>7天无理由退货</li>
                <li class="font_top_i">|</li>
                <li>15天免费换货</li>
                <li class="font_top_i">|</li>
                <li>满150元包邮</li>
                <li class="font_top_i">|</li>
                <li>520余家售后网点</li>
            </ul>
        </div>
        <div class="foot_bottom">
            <div class="foot_bottom_l">
                <dl>
                    <dt>帮助中心</dt>
                    <dd>购物指南</dd>
                    <dd>支付方式</dd>
                    <dd>配送方式</dd>
                </dl>
                <dl>
                    <dt>服务支持</dt>
                    <dd>售后政策</dd>
                    <dd>自助服务</dd>
                    <dd>相关下载</dd>
                </dl>
                <dl>
                    <dt>大米之家</dt>
                    <dd>大米之家</dd>
                    <dd>服务网点</dd>
                    <dd>预约亲临到店服务</dd>
                </dl>
                <dl>
                    <dt>关注我们</dt>
                    <dd>新浪微博</dd>
                    <dd>大米部落</dd>
                    <dd>官方微信</dd>
                </dl>
            </div>
            <div class="foot_bottom_r">
                <a>400-100-5678</a>
                <a>周一至周日 8:00-18:00</a>
                <a>（仅收市话费）</a>
                <span> 24小时在线客服</span>
            </div>
        </div>
    </div>
    <div class="foot_note_box">
        <div class="foot_note_wrap">
            <div class="foot_note_con">
                <span class="foot_logo"><img src="img/mi-logo.png" width="38px" height="38px"></span>
                <span class="foot_note_txt">
							<a>大米网</a><h>|</h><a>MIUI</a><h>|</h><a>米聊</a><h>|</h><a>多看书城</a><h>|</h><a>大米路由器</a><h>|</h><a>大米后院</a><h>|</h><a>大米天猫店</a><h>|</h><a>大米淘宝直营店</a><h>|</h><a>大米网盟</a><h>|</h><a>问题反馈</a><h>|</h><a>Select Region</a>
						    <a> 5555555号</a>
						</span>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript" src="js/xiaomi.js"></script>
<script>

    $("#find_input").keyup(function() {
        //获取content输入框的内容
        var content =$(this).val();
        //如果输入框为空的话
        if(content=="")
        {
            //就不显示提示框
            $("#context1").css("display","none");
            return;
        }

        var time = new Date().getTime();
        $.ajax({
            url:'searchNames',
            type:'get',
            data:{pName:content,time:time},
            dataType:'json',
            success:function(data){
                var html="";
                for(var i =0;i<data.length;i++) {
                    html += "<div onclick='setSearch_onclick(this)' onmouseout='changeBackColor_out(this)'  " +
                        "onmouseover='changeBackColor_over(this)'>" + data[i].pName + "</div>";
                }
                $("#context1").html(html);
                $("#context1").css("display","block");
            },
            error:function()
            {
                alert('ajax执行失败');
            }
        });
    });

    function changeBackColor_over(div) {
        $(div).css("background-color","#CCCCCC");
    }

    function changeBackColor_out(div) {
        $(div).css("background-color","")
    }

    function setSearch_onclick(div) {
        $("#find_input").val(div.innerText);
        $("#context1").css("display","none");
    }

    //通过pName返回所有商品
    function getByName() {
        //获取pName的内容
        var pName = $("#find_input").val();
        //把pName传给后台
        window.location.href = "search?pName=" + pName;
    }

</script>

</body>
</html>