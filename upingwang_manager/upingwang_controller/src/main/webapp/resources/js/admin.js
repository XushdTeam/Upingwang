/**
 * 首页
 * Created by Xushd on 2017/1/19 0019.
 */


layui.define(['layer', 'layer', 'common', 'navbar', 'tab','sha256'], function(exports){
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
            //绑定导航数据
            var $menu = $('#menu');
            $menu.find('li.layui-nav-item').each(function () {
                var $this = $(this);
                //绑定一级导航的点击事件
                $this.on('click', function () {
                    //获取设置的模块ID
                    var id = $this.find('a').data('fid');
                    navbar.set({
                        elem: '#admin-navbar-side',
                        url: '/menu/json/'+id,
                        cached:true
                     });
                     navbar.render();
                     navbar.on('click(side)', function(data) {
                     tab.tabAdd(data.field);
                     });
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
                    var lockIndex = layer.open({
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
                                unlock(userName, pwd);
                            });
                            /**
                             * 解锁操作方法
                             * @param {String} 用户名
                             * @param {String} 密码
                             */
                            var unlock = function(un, pwd) {
                               
                                pwd = sha256.sha256_digest(pwd);
                                common.ajax("/lock/"+un+"/"+pwd,"POST","json",{},function (err, res) {
                                    if(err){
                                        //lockIndex.anim();
                                    }else {
                                        layer.close(lockIndex);
                                    }
                                });
                            };
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