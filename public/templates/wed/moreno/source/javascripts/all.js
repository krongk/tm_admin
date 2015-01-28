//= require_tree .
//= require turbolinks

//# require jquery #version = jQuery v2.1.1
//# require jquery.pjax #version = last version from https://github.com/defunkt/jquery-pjax

// 监控所有class为pjaxlink的链接，
// 采用pjax更新链接页面中id为wrapper的容器内容到本页面中id为pjax-container的容器中,
// 若获取内容时间超过5秒，则直接跳转：
$(document).pjax('a.pjaxlink', '#pjax-container', {fragment:'#wrapper', timeout:5000});

// 监听Pjax执行状态
if ($.support.pjax) {
    $(document).on('pjax:send', function() {
        //在pjax发送请求时，显示loading动画层
        $('#loading').show();
    });
    $(document).on('pjax:complete', function() {
        //在pjax处理完成后，隐藏loading动画层
        //由于速度太快会导到loading层闪烁，影响体验，所以在此加上500毫秒延迟
        setTimeout(function(){$('#loading').hide()},500);
    });
}