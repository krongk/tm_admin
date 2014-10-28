/**
 *  全局函数处理
 *  -----------------------------
 *  一张网页，要经历怎样的过程，才能抵达用户面前
 *  一个特效，要经历这样的修改，才能让用户点个赞
 *  一个产品，创意源于生活，源于内心，需要慢慢品味
 *********************************************************************************************/

//定义这个全局变量用于跨站点图片
host_base_url = "http://wedxt.cn/templates/wed/mask-lightapp"

var wedxt = {
/****************************************************************************************************/
/*  对象私有变量/函数返回值/通用处理函数
*****************************************************************************************************/  
/*************************
 *  = 对象变量，判断函数
 *************************/
  _events     : {},                 // 自定义事件---this._execEvent('scrollStart');
  _windowHeight : $(window).height(),         // 设备屏幕高度
  _windowWidth  : $(window).width(),

  _rotateNode   : $('.p-ct'),             // 旋转体

  _page       : $('.m-page'),             // 模版页面切换的页面集合
  _pageNum    : $('.m-page').size(),          // 模版页面的个数
  _pageNow    : 0,                  // 页面当前的index数
  _pageNext   : null,                 // 页面下一个的index数

  _touchStartValY : 0,                  // 触摸开始获取的第一个值
  _touchDeltaY  : 0,                  // 滑动的距离

  _moveStart    : true,                 // 触摸移动是否开始
  _movePosition : null,                 // 触摸移动的方向（上、下）
  _movePosition_c : null,                 // 触摸移动的方向的控制
  _mouseDown    : false,                // 判断鼠标是否按下
  _moveFirst    : true,
  _moveInit   : false,

  _map      : $('.ylmap'),              // 地图DOM对象
  _mapValue   : null,                 // 地图打开时，存储最近打开的一个地图
  _mapIndex   : null,                 // 开启地图的坐标位置

  _audioNode    : $('.u-audio'),            // 声音模块
  _audio      : null,                 // 声音对象
  _audio_val    : true,                 // 声音是否开启控制
  
  _elementStyle : document.createElement('div').style,  // css属性保存对象

  _UC       : RegExp("Android").test(navigator.userAgent)&&RegExp("UC").test(navigator.userAgent)? true : false,
  _weixin     : RegExp("MicroMessenger").test(navigator.userAgent)? true : false,
  _iPhoen     : RegExp("iPhone").test(navigator.userAgent)||RegExp("iPod").test(navigator.userAgent)||RegExp("iPad").test(navigator.userAgent)? true : false,
  _Android    : RegExp("Android").test(navigator.userAgent)? true : false,
  _IsPC     : function(){ 
            var userAgentInfo = navigator.userAgent; 
            var Agents = new Array("Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"); 
            var flag = true; 
            for (var v = 0; v < Agents.length; v++) { 
              if (userAgentInfo.indexOf(Agents[v]) > 0) { flag = false; break; } 
            } 
            return flag; 
          } ,

/***********************
 *  = gobal通用函数
 ***********************/
  // 判断函数是否是null空值
  _isOwnEmpty   : function (obj) { 
            for(var name in obj) { 
              if(obj.hasOwnProperty(name)) { 
                return false; 
              } 
            } 
            return true; 
          },
  // 微信初始化函数
  _WXinit     : function(callback){
            if(typeof window.WeixinJSBridge == 'undefined' || typeof window.WeixinJSBridge.invoke == 'undefined'){
              setTimeout(function(){
                this.WXinit(callback);
              },200);
            }else{
              callback();
            }
          },
  // 判断浏览器内核类型
  _vendor     : function () {
            var vendors = ['t', 'webkitT', 'MozT', 'msT', 'OT'],
              transform,
              i = 0,
              l = vendors.length;
        
            for ( ; i < l; i++ ) {
              transform = vendors[i] + 'ransform';
              if ( transform in this._elementStyle ) return vendors[i].substr(0, vendors[i].length-1);
            }
            return false;
          },
  // 判断浏览器来适配css属性值
  _prefixStyle  : function (style) {
            if ( this._vendor() === false ) return false;
            if ( this._vendor() === '' ) return style;
            return this._vendor() + style.charAt(0).toUpperCase() + style.substr(1);
          },
  // 判断是否支持css transform-3d（需要测试下面属性支持）
  _hasPerspective : function(){
            var ret = this._prefixStyle('perspective') in this._elementStyle;
            if ( ret && 'webkitPerspective' in this._elementStyle ) {
              this._injectStyles('@media (transform-3d),(-webkit-transform-3d){#modernizr{left:9px;position:absolute;height:3px;}}', function( node, rule ) {
                ret = node.offsetLeft === 9 && node.offsetHeight === 3;
              });
            }
            return !!ret;
          },
    _translateZ : function(){
            if(wedxt._hasPerspective){
              return ' translateZ(0)';
            }else{
              return '';
            }
          },

  // 判断属性支持是否
  _injectStyles   : function( rule, callback, nodes, testnames ) {
            var style, ret, node, docOverflow,
              div = document.createElement('div'),
              body = document.body,
              fakeBody = body || document.createElement('body'),
              mod = 'modernizr';

            if ( parseInt(nodes, 10) ) {
              while ( nodes-- ) {
                node = document.createElement('div');
                node.id = testnames ? testnames[nodes] : mod + (nodes + 1);
                div.appendChild(node);
                }
            }

            style = ['&#173;','<style id="s', mod, '">', rule, '</style>'].join('');
            div.id = mod;
            (body ? div : fakeBody).innerHTML += style;
            fakeBody.appendChild(div);
            if ( !body ) {
              fakeBody.style.background = '';
              fakeBody.style.overflow = 'hidden';
              docOverflow = docElement.style.overflow;
              docElement.style.overflow = 'hidden';
              docElement.appendChild(fakeBody);
            }

            ret = callback(div, rule);
            if ( !body ) {
              fakeBody.parentNode.removeChild(fakeBody);
              docElement.style.overflow = docOverflow;
            } else {
              div.parentNode.removeChild(div);
            }

            return !!ret;
          },
  // 自定义事件操作
  _handleEvent  : function (type) {
            if ( !this._events[type] ) {
              return;
            }

            var i = 0,
              l = this._events[type].length;

            if ( !l ) {
              return;
            }

            for ( ; i < l; i++ ) {
              this._events[type][i].apply(this, [].slice.call(arguments, 1)); 
            }
          },
  // 给自定义事件绑定函数
  _on       : function (type, fn) {
            if ( !this._events[type] ) {
              this._events[type] = [];
            }

            this._events[type].push(fn);
          },
  //禁止滚动条
  _scrollStop   : function(){
            //禁止滚动
            $(window).on('touchmove.scroll',this._scrollControl);
            $(window).on('scroll.scroll',this._scrollControl);
          },
  //启动滚动条
  _scrollStart  : function(){   
            //开启屏幕禁止
            $(window).off('touchmove.scroll');
            $(window).off('scroll.scroll');
          },
  //滚动条控制事件
  _scrollControl  : function(e){e.preventDefault();},

/**
 *  media资源管理
 *  -->绑定声音控制事件
 *  -->函数处理声音的开启和关闭
 *  -->异步加载声音插件（延迟做）
 *  -->声音初始化
 *  -->视频初始化
 *  -->声音和视频切换的控制
 */
  // 声音初始化
  audio_init : function(){
    // media资源的加载
    var options_audio = {
      loop: true,
            preload: "auto",
            src: wedxt._audioNode.attr('data-src')
    }
    
        wedxt._audio = new Audio(); 

        for(var key in options_audio){
            if(options_audio.hasOwnProperty(key) && (key in wedxt._audio)){
                wedxt._audio[key] = options_audio[key];
            }
        }
        wedxt._audio.load();
  },

  // 声音事件绑定
  audio_addEvent : function(){
    if(wedxt._audioNode.length<=0) return;

    // 声音按钮点击事件
    var txt = wedxt._audioNode.find('.txt_audio'),
      time_txt = null;
    wedxt._audioNode.find('.btn_audio').on('click',wedxt.audio_contorl);

    // 声音打开事件
    $(wedxt._audio).on('play',function(){
      wedxt._audio_val = false;

      audio_txt(txt,true,time_txt);

      // 开启音符冒泡
    //   $.fn.coffee.start();
    //   $('.coffee-steam-box').show(500);
    })

    // 声音关闭事件
    $(wedxt._audio).on('pause',function(){
      audio_txt(txt,false,time_txt)

      // 关闭音符冒泡
    //   $.fn.coffee.stop();
    //   $('.coffee-steam-box').hide(500);
    })

    function audio_txt(txt,val,time_txt){
      if(val) txt.text('打开');
      else txt.text('关闭');

      if(time_txt) clearTimeout(time_txt);

      txt.removeClass('z-move z-hide');
      time_txt = setTimeout(function(){
        txt.addClass('z-move').addClass('z-hide');
      },1000)
    }
  },

  // 声音控制函数
  audio_contorl : function(){
    if(!wedxt._audio_val){
      wedxt.audio_stop();
    }else{
      wedxt.audio_play();
    }
  },  

  // 声音播放
  audio_play : function(){
    wedxt._audio_val = false;
    if(wedxt._audio) wedxt._audio.play();
  },

  // 声音停止
  audio_stop  : function(){
    wedxt._audio_val = true;
    if(wedxt._audio) wedxt._audio.pause(); 
  },

  // media管理初始化
  media_init : function(){
    // 声音初始化
    wedxt.audio_init();
    // 绑定音乐加载事件
    wedxt.audio_addEvent();
  },

  // 根据设备的高度，来适配每一个模版的高度，并且静止滑动
  // --文档初始化计算
  // --页面切换完成计算
  height_auto : function(ele,val){
    ele.children('.page-con').css('height','auto');
    var height = wedxt._windowHeight;

    // 需要解除固定高度的page卡片
    var vial = true;
    if(!vial){
      if(ele.height()<=height){
        ele.children('.page-con').height(height+2);
        if((!$('.p-ct').hasClass('fixed'))&&val=='true') $('.p-ct').addClass('fixed');
      }else{
        wedxt._scrollStart();
        if(val=='true') $('.p-ct').removeClass('fixed');
        ele.children('.page-con').css('height','100%');
        return;
      }
    }else{
      ele.children('.page-con').height(height+2);
      if((!$('.p-ct').hasClass('fixed'))&&val=='true') $('.p-ct').addClass('fixed');
    }
  },

/**
 *  图片延迟加载功能
 *  -->替代需要延迟加载的图片
 *  -->优化加载替代图片
 *  -->切换功能触发图片的延迟加载
 *  -->替代图片为400*400的透明大图片
 */
  /* 图片延迟加载 */
  lazy_img : function(){
    var lazyNode = $('.lazy-img');
    lazyNode.each(function(){
      var self = $(this);
      if(self.is('img')){
        self.attr('src', host_base_url + '/img/loading_large.gif');
      }else{
        // 把原来的图片预先保存下来
        var position = self.css('background-position'),
          size = self.css('background-size');

        self.attr({
          'data-position' : position,
          'data-size' : size
        });

        if(self.attr('data-bg')=='no'){
          self.css({
            'background-repeat' : 'no-repeat'
          })
        }

        self.css({
          'background-image'  : 'url(' + host_base_url + '/img/loading_large.gif)',
          'background-size' : '120px 120px',
          'background-position': 'center'
        })

        if(self.attr('data-image')=='no'){
          self.css({
            'background-image'  : 'none'
          })
        }
      }
    })
  },

  // 开始加载前三个页面
  lazy_start : function(){
    // 前三个页面的图片延迟加载
    setTimeout(function(){
      for(var i=0;i<3;i++){
        var node = $(".m-page").eq(i);
        if(node.length==0) break;
        if(node.find('.lazy-img').length!=0){
          wedxt.lazy_change(node,false);
          // 飞出窗口的延迟
          if(node.attr('data-page-type')=='flyCon'){
            wedxt.lazy_change($('.m-flypop'),false);
          }
        }else continue;
      }
    },200)
  },
  
  // 加载当前后面第三个
  lazy_bigP : function(){
    for(var i=3;i<=5;i++){
      var node = $(".m-page").eq(wedxt._pageNow+i);
      if(node.length==0) break;
      if(node.find('.lazy-img').length!=0){
        wedxt.lazy_change(node,true);
        // 飞出窗口的延迟
        if(node.attr('data-page-type')=='flyCon'){
          wedxt.lazy_change($('.m-flypop'),false);
        }
      }else continue;
    }
  },

  // 图片延迟替换函数
  lazy_change : function(node,goon){
    // 3d图片的延迟加载
    if(node.attr('data-page-type')=='3d') wedxt.lazy_3d(node);

    // 飞出窗口的延迟
    if(node.attr('data-page-type')=='flyCon'){
      var img = $('.m-flypop').find('.lazy-img');
      img.each(function(){
        var self = $(this),
          srcImg = self.attr('data-src');

        $('<img />')
          .on('load',function(){
            if(self.is('img')){
              self.attr('src',srcImg)
            }
          })
          .attr("src",srcImg);
      })
    }

    // 其他图片的延迟加载
    var lazy = node.find('.lazy-img');
    lazy.each(function(){
      var self = $(this),
        srcImg = self.attr('data-src'),
        position = self.attr('data-position'),
        size = self.attr('data-size');

      if(self.attr('data-bg')!='no'){
        $('<img />')
          .on('load',function(){
            if(self.is('img')){
              self.attr('src',srcImg)
            }else{
              self.css({
                'background-image'  : 'url('+srcImg+')',
                'background-position' : position,
                'background-size' : size
              })
            }

            // 判断下面页面进行加载
            if(goon){
              for(var i =0;i<$(".m-page").size();i++){
                var page = $(".m-page").eq(i);
                if($(".m-page").find('.lazy-img').length==0) continue
                else{
                  wedxt.lazy_change(page,true);
                }
              }
            }
          })
          .attr("src",srcImg);

        self.removeClass('lazy-img').addClass('lazy-finish');
      }else{
        if(self.attr('data-auto')=='yes') self.css('background','none');
      }
    })  
  },

  // loading显示
  loadingPageShow : function(){
    $('.u-pageLoading').show();
  },
  
  // loading隐藏
  loadingPageHide : function (){
    $('.u-pageLoading').hide(); 
  },

  // 对象私有变量刷新
  refresh : function(){
    wedxt._windowHeight = $(window).height();
    wedxt._windowWidth = $(window).width();
  },

/**************************************************************************************************************/
/*  函数初始化
***************************************************************************************************************/
/**
 *  相关插件的启动
 */
  //插件启动函数
  plugin : function(){

    // //音符飘逸
    // $('#coffee_flow').coffee({
    //   steams        : ["<img src= '" + host_base_url + "/img/audio_widget_01@2x.png' />","<img src='" + host_base_url + "/img/audio_widget_01@2x.png' />"], 
    //   steamHeight     : 100,
    //   steamWidth      : 44 
    // });

    // 蒙板插件
    var node = $('#j-mengban')[0],
      url = host_base_url + '/img/page_01_bg@2x.jpg',
      canvas_url = $('#r-cover').val(),
      type = 'image',
      w = 640,
      h = wedxt._windowHeight,
      callback = wedxt.start_callback;

    wedxt.cover_draw(node,url,canvas_url,type,w,h,callback);

    // 微信分享
    var option_wx = {};

    if($('#r-wx-title').val()!='') option_wx.title = $('#r-wx-title').val();
    if($('#r-wx-img').val()!='') option_wx.img = $('#r-wx-img').val();
    if($('#r-wx-con').val()!='') option_wx.con = $('#r-wx-con').val();

    if(wedxt._weixin) $(document.body).wx(option_wx);
  },

  // 蒙板插件初始化函数处理
  cover_draw : function(node,url,canvas_url,type,w,h,callback){
    if(node.style.display.indexOf('none')>-1) return;
    
    var lottery = new Lottery(node, canvas_url, type, w, h, callback);
    lottery.init();
  },

  // 蒙板插件回调函数处理
  start_callback : function(){
    
    // 隐藏蒙板
    $('#j-mengban').removeClass('z-show');
    setTimeout(function(){
      $('#j-mengban').addClass('f-hide');
    },1000)

    //删掉封面层
    $('.p-ct').remove();

    // 开启window的滚动
    wedxt._scrollStart();

    // 箭头显示
    $('.u-arrow').removeClass('f-hide');

    // 播放声音
    if(!wedxt._audio) return;
    wedxt._audioNode.removeClass('f-hide');
    wedxt._audio.play();

    // 声音启动
    $(document).one("touchstart", function(){
        wedxt._audio.play();
    });
  },

/**
 * app初始化
 */
  // 样式适配
  styleInit : function(){
    // 禁止文版被拖动
    document.body.style.userSelect = 'none';
    document.body.style.mozUserSelect = 'none';
    document.body.style.webkitUserSelect = 'none';

    // 判断设备的类型并加上class
    if(wedxt._IsPC()) $(document.body).addClass('pc');
    else $(document.body).addClass('mobile');
    if(wedxt._Android) $(document.body).addClass('android');
    if(wedxt._iPhoen) $(document.body).addClass('iphone');

    // 判断是否有3d
    if(!wedxt._hasPerspective()){
      wedxt._rotateNode.addClass('transformNode-2d');
      $(document.body).addClass('no-3d');
    }
    else{
      wedxt._rotateNode.addClass('transformNode-3d');
      $(document.body).addClass('perspective');
      $(document.body).addClass('yes-3d');
    }

    // 图片延迟加载的处理
    this.lazy_img();

    // 模版提示文字显示
    setTimeout(function(){
      $('.m-alert').find('strong').addClass('z-show');
    },1000)

    $('.u-arrow').on('touchmove',function(e){e.preventDefault()})
  },

  // 对象初始化
  init : function(){
    
    wedxt.loadingPageShow();
    // 样式，标签的渲染
    // 对象操作事件处理
    this.styleInit();
    //this.haddle_envent_fn();
    
    // 禁止滑动
     this._scrollStop();

    // 绑定全局事件函数处理
    $(window).on('resize',function(){
     wedxt.refresh();
    })
    
    // 图片预先加载
    $('<img />').attr('src',$('#r-cover').val());
    $('<img />').attr('src',$('.m-fengye').find('.page-con').attr('data-src'));

    // loading执行一次
    var loading_time = new Date().getTime();
    
    $(window).on('load',function(){
      var now = new Date().getTime();
      var loading_end = false;
      var time;
      var time_del = now - loading_time;

      if ( time_del >= 2200 ) {
        loading_end = true;
      }

      if ( loading_end ) {
        time = 0;
      } else {
        time = 2200 - time_del;
      }

      // loading完成后请求
      setTimeout(function(){
        wedxt.loadingPageHide();
        
        // 插件加载
        wedxt.plugin();

        // 模版提示隐藏
        setTimeout(function(){
          $('.m-alert').addClass('f-hide');
        },1000)

        // 显示正面
        $('#j-mengban').addClass('z-show');

        // 显示封面内容
        setTimeout(function(){
          $('.translate-back').removeClass('f-hide');
          $('.m-fengye').removeClass('f-hide');
          wedxt.height_auto(wedxt._page.eq(wedxt._pageNow),'false');
        },1000)

        // setTimeout(function(){
     //              window.scrollTo(0, 1);
     //          }, 0);

        // media初始化
        wedxt.media_init();

        // 延迟加载后面三个页面图片
        wedxt.lazy_start();

        // 报名提交执行
        // wedxt.signUp_submit();
        
        
        // var channel_id = location.search.substr(location.search.indexOf("channel=") + 8);
        // channel_id= channel_id.match(/^\d+/) ; 
        // if (!channel_id || isNaN(channel_id) || channel_id<0) {
        // channel_id = 1;
        // }
      //    var activity_id = $('#activity_id').val();
      //    var url = "/auto/analyse/"+activity_id + "?channel="+channel_id;
        //  //报名统计请求
       //   $.get(url,{},function(){});
      },time)
    })
  }
};

/*初始化对象函数*/
wedxt.init();


