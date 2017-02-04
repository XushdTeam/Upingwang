/**
 * 首页
 * Created by Xushd on 2017/1/19 0019.
 */


layui.define(['layer', 'common', 'navbar', 'tab','sha256'], function(exports){
    var $ = layui.jquery,
        layer = layui.layer,
        common = layui.common,
        navbar = layui.navbar(),
        sha256 = layui.sha256,
        tab = layui.tab({elem: '.layui-tab-card' //设置选项卡容器
        });

    var obj = {
        init:function () {

            //清楚菜单缓存
            layui.data("tb_navbar", null);

            //iframe自适应
            $(window).on('resize', function () {

                var $content = $('.admin-nav-card .layui-tab-content');
                $content.height($(this).height() - 155);
                $content.find('iframe').each(function () {
                    $(this).height($content.height());
                });

            }).resize();
            //防止iframe嵌套
            window.top.location !== window.location && (window.top.location = window.location);
            var now_index = 0;
            //绑定导航数据
            $(".layui-nav-item",$("#menu")).on("click",function () {
                var $this = $(this);
                //获取设置的模块ID
                var id = $this.find('a').data('fid');
                if(id==now_index)return;
                now_index  = id;
                common.ajax('/menu/json/'+id,function (err,res) {
                    if(err){
                        common.layerAlertW(err.message);
                    }else{
                        //设置navbar
                        navbar.set({
                            elem: '#admin-navbar-side', //存在navbar数据的容器ID
                            data: res.data
                        });
                        //渲染navbar
                        navbar.render();
                        navbar.on('click(side)', function(data) {
                            tab.tabAdd(data.field);
                        });
                    }
                });
            });
            //首页交互
            var adminActive = {
                /**
                 * 退出登录
                 */
                doLoginOut: function () {
                    var url = $(this).data('href');
                    common.signOut(url,function(err,res) {
                        if(err){
                            common.layerAlertE(err,"提示");
                        }else{
                            window.location.href = res;
                        }
                        
                    });
                },
                /**
                 * 锁屏
                 */
                doLock:function(){
                    layer.open({
                        title: false,
                        type: 1,
                        closeBtn: 0,
                        anim: 6,
                        content: $('#lock-temp').html(),
                        shade: [0.9, '#393D49'],
                        success: function(layero, lockIndex) {
                            //给显示用户名赋值
                            layero.find('input[name=lockPwd]').on('focus', function() {
                                    var $this = $(this);
                                    if($this.val() === '输入密码解锁..') {
                                        $this.val('').attr('type', 'password');
                                    }
                                })
                                .on('blur', function() {
                                    var $this = $(this);
                                    if($this.val() === '' || $this.length === 0) {
                                        $this.attr('type', 'text').val('输入密码解锁..');
                                    }
                                });

                            //绑定解锁按钮的点击事件
                            layero.find('button#unlock').on('click', function() {
                                var $lockBox = $('div#lock-box');

                                var userName = $lockBox.find('div#lockUserName').text();
                                var pwd = $lockBox.find('input[name=lockPwd]').val();
                                if(pwd === '输入密码解锁..' || pwd.length === 0) {
                                    layer.msg('请输入密码..', {
                                        icon: 2,
                                        time: 1000
                                    });
                                    return;
                                }
                                pwd = sha256.sha256_digest(pwd);
                                $.ajax({
                                    url: "/lock/" + userName + "/" + pwd,
                                    type: "POST",
                                    dataType: "json",
                                    data: {},
                                    success: function (data, startic) {
                                        if (data.status == 200) {
                                            layer.close(lockIndex);
                                        }
                                        else {
                                            layer.msg(data.message, {icon: 2, time: 1000});
                                        }
                                    }
                                });
                            });

                        }
                    });

                }

            };
           
            //绑定 首页 顶部 点击事件
            $('.do-admin').on('click', function (event) {
                var type = $(this).data('type');
                adminActive[type] ? adminActive[type].call(this) : '';
                return false;
            });
            //

            //左侧菜单收缩
            var foldNode = $('#sidebar');
            var sidebarNode = $('#sidebar-side');
            var headerNode = $('.header-admin');
            var toType = sidebarNode.hasClass("sidebar-mini") ? "full" : "mini";
            if (foldNode) {
                $(document).on("click", '#sidebar', function () {
                    var toType = sidebarNode.hasClass("sidebar-mini") ? "full" : "mini";
                    var sideWidth = sidebarNode.width();
                    if (sideWidth === 200) {
                        $('#admin-body').animate({
                            left: '70px'
                        }); //admin-footer
                        $('#admin-footer').animate({
                            left: '70px'
                        });
                        sidebarNode.addClass('sidebar-mini');
                        //headerNode.addClass('header-mini');
                        $('#sidebar').find('i').removeClass('fa-bars').addClass('fa-th-large');

                    } else {
                        $('#admin-body').animate({
                            left: '200px'
                        });
                        $('#admin-footer').animate({
                            left: '200px'
                        });
                        sidebarNode.removeClass('sidebar-mini');
                        //headerNode.removeClass('header-mini');
                        $('#sidebar').find('i').removeClass('fa-th-large').addClass('fa-bars');
                    }
                });
            }
        }
    }
    exports("admin",obj);
});