var isInitPage=false;
var sslider;

window.addEventListener("onorientationchange" in window ? "orientationchange" : "resize", orientationChange, false); 
loadImages([Think.imagePath+'loading.gif',
    Think.imagePath+'logo1.png',
    Think.imagePath+'logo2.png',
    Think.imagePath+'bg01.jpg',
    Think.imagePath+'icon_bt.png',
    Think.imagePath+'bg02.jpg',
    Think.imagePath+'bg03.jpg',
    Think.imagePath+'info_bg.png',
    Think.imagePath+'bg03_02.jpg',
    Think.imagePath+'bg04_02.jpg',
    Think.imagePath+'bg05_02.jpg',
    Think.imagePath+'bg05.jpg',
    Think.imagePath+'bg06.jpg',
    Think.imagePath+'bg07.jpg',
    Think.imagePath+'play_bt.jpg',
    Think.imagePath+'bg3_icon.png',
    Think.imagePath+'share_bg.png',
    Think.imagePath+'share_arrow.png',
    Think.imagePath+'bg04.jpg'],function(){
    if(!isInitPage){
        isInitPage=true;
        $('.loading_cotent,.loading').hide();
        initPage();
    }
});
function orientationChange(){//alert(window.orientation)
    switch(window.orientation) { 
        case 0:
          $("#mask").hide();//alert(1)
          break;
        case 180:
          $("#mask").hide();
          break;
        case -90:
          $("#mask").show();
          break;
        case 90:
          $("#mask").show();//alert(2)
          break;
    } 
} 


function loadImages(sources, callback){
    var count = 0,
        images ={},
        imagesNum = sources.length;
    for(src in sources){
        images[src] = new Image();
        images[src].onload = function(){
        //console.log('加载'+count)
            if(++count >= imagesNum){
                callback(images);
            }
          }
        images[src].src = sources[src];
    }
}


var formIsSubmit=false;
var formSubmitIng=false;

//提示框组件
var topts={element:$('.dia-tips'),content:$('.dia-tips span'),time:300,transition:'ease',callback:function(){},timeout:3000,timeouter:{},canclose:true,minScale:1,maxScale:4};
topts.open=function(color,msg,callback,canclose){
    topts.canclose=canclose==undefined?true:canclose;
    topts.callback=callback==undefined?function(){}:callback;
    topts.content.html(msg);
    topts.content.css('color',color);
    topts.element.css('display','block').animate({opacity:1,scale:topts.minScale},topts.time,topts.transition);
    clearTimeout(topts.timeouter);
    topts.timeouter=setTimeout(function(){
        topts.close();
    },topts.timeout);
};
topts.close=function(fn){
    clearTimeout(topts.timeouter);
    topts.element.animate({opacity:0,scale:topts.maxScale},topts.time,topts.transition,function(){
        $(this).css('display','none');
        fn!=undefined && fn();
        topts.callback();
        topts.callback=function(){};
    });
};
$('*').tap(function(evt){
    if(topts.canclose){
        $(evt.target).attr('data-fn')!='tips' && topts.close();
    }
});
//所有点击要弹窗提示框的节点
$('.submit').each(function(){
    $(this).attr('data-fn','tips');
    $(this).find('*').attr('data-fn','tips');
});

// var $music = document.getElementById('music');
// var video_code = ('<div class="video"><video preload="auto" controls="controls" poster="./images/play_bt.jpg" width="640" height="360" class="video_show"><source src="./js/CG480.mp4" type="video/mp4">你的浏览器不支持HTML5格式的播放器！</video></div>')
var video_code = ('<div class="video"><iframe frameborder=0 src="http://v.qq.com/iframe/player.html?vid=v0137wu46ea&tiny=0&auto=0" width="640" height="360" allowfullscreen></iframe></div>')
 $(function(){
//     // 播放音乐
//     $('.music').tap(function(){
//         if($music.paused){
//            $music.play();$(this).removeClass('stop');
//         }else{
//            $music.pause();$(this).addClass('stop');
//         }
//     });
     $('.video_bg a').tap(function(){
         //$music.pause();$('.music').addClass('stop');
         $('.video_content').addClass('show');
         $('.vie').append(video_code);
     });
     $('.close').tap(function(){
         $('.video_content').removeClass('show');
         $('.vie').html('')
         //$music.play();$('.music').removeClass('stop');
     });
 });

// $music.addEventListener('ended',function(){
//     setTimeout(function(){
//         $music.play();
//     },100);
    
// });

var initPage = function(){
  // $music.play();
  $('#cube').css('height',$(window).height());
  $('body').css('height',$(window).height());
    sslider = $('.wrp').SlitSlider({speed:1000,loop:false});
    $('.wrp').addClass('start');
    $('.stage1').addClass('show');
    setTimeout(function(){
      $('.stage1').addClass('cross');
    },1000);
    
    $('.start_area').tap(function(){
      // $music.play();
      sslider.next();$('.stage1').addClass('opa');
      $('.stage2').addClass('show');
      $('.cube_con').addClass('show');
      $('.stage1').addClass('hide');
      $('.ico').hide();
      $('.app').css('background','#fff');
    });

    $('.submit').tap(function(){
        if(!formIsSubmit && !formSubmitIng){
            formSubmitIng=true;
            $.post(Think.urlSave,{name:$('input[name="name"]').val(),tel:$('input[name="tel"]').val()},function(json){
                formSubmitIng=false;
                if(json.err==0){
                    formIsSubmit=true;
                    topts.open('#fff',json.msg,function(){
                        $('.share_bg').show().addClass('selected');
                    });
                }else if(json.err==1){
                    topts.open('#fff',json.msg);
                }else{
                    topts.open('#fff','服务器繁忙');
                }
            });
        }
    });

    $('body').keydown(function(evt){
        switch(evt.keyCode) {
            case 37: // left
                yAngle -= 90;
                left();
                break;
            case 38: // up
                xAngle += 5;
                break;
            case 39: // right
                yAngle += 90;
                right();
                break;
            case 40: // down
                xAngle -= 5;
                break;
        };
        // $('#cube').css({"-webkit-transform" : "rotateY("+yAngle+"deg) rotateX("+0+"deg)"});
    });
}


var $index_x = 0,$index_y = 0,xAngle=0,yAngle=0;
function left(){
    if ($index_y == 0)return;
    $index_y--;//console.log($index_y)
    yAngle = $index_y*-90;
    $('#cube').css({"-webkit-transform" : "rotateY("+yAngle+"deg) rotateX(0deg)"});
    $('#cube .face').removeClass('show').eq($index_y).addClass('show');
    if($index_y == 2){
      $('#cube .face').eq(0).show();
      $('#cube .face').eq(4).hide();
    }
}
function right(){
    if ($index_y == 4)return;
    $index_y++;//console.log($index_y)
    yAngle = $index_y*-90;
    $('#cube').css({"-webkit-transform" : "rotateY("+yAngle+"deg) rotateX(0deg)"});
    $('#cube .face').removeClass('show').eq($index_y).addClass('show');
    $('#cube .face.one').removeClass('open');
    if($index_y == 3){
      $('#cube .face').eq(0).hide();
      $('#cube .face').eq(4).show();
    }
}

var startX = 0, startY = 0; 
function touchstart(e){
    // e.preventDefault();
    touchDown = true;
    var touch = e.targetTouches[0];
    startX = touch.clientX;
    startY = touch.clientY;
}

function touchmove(e){
    e.preventDefault();
    
    // var touch = e.targetTouches[0];
    // endX = touch.clientX;
    // if(e.pageY!=startY){
    //     var temp = (endX - startX)*0.24;console.log(temp);
    // }
    // $('#cube').css({"-webkit-transform" : "rotateY("+temp+"deg) rotateX(0deg)"});
}

function touchend(e){
    touchDown = false;
    // 抬起点，页面位置
    var touch = e.changedTouches[0];
    endX = touch.clientX;
    endY = touch.clientY;
    value_x = Math.abs(endX-startX);
    value_y = Math.abs(endY-startY);
    // alert(endX+','+endY);
    // swip 事件默认大于50px才会触发，小于这个就将页面归回
    if(value_x<=50 && value_y<=50){//alert('不滑动')
        e.preventDefault();
    }else if(value_y>20 && value_x<=50){
        e.preventDefault();console.log('sdf');
    }else{
        if(value_x > value_y){
            if(endX-startX>0){
                left();
            }else{
                right();
            }
        }
    }
}

var $page = document.getElementById("cube_con");
$page.addEventListener("touchstart",touchstart,false);
$page.addEventListener("touchmove",touchmove,false);
$page.addEventListener("touchend",touchend,false);

//
$('.ind-btnshare').tap(function(){
    $('.share_bg').show().addClass('selected');
});

//
$('.finish_bt').tap(function(){
	window.location.href='http://mp.weixin.qq.com/s?__biz=MjM5NzU0ODQyNQ==&mid=200794252&idx=1&sn=bc4f36590d017d19624f80fbb969f2fd#rd';
});





