jQuery(document).ready(function($) {
  $(".entry-video").fitVids();
  //selectnav('nav');
  jQuery("a[rel^='prettyPhoto']").prettyPhoto({
    social_tools: false
  });
  var allPanels = $('.accordion > .inner').hide();
  $('.accordion > .title > a').click(function() {
    $this = $(this);
    $target = $this.parent().next();
    if (!$target.hasClass('active')) {
      allPanels.slideUp(400, 'easeOutCirc');
      $target.slideDown(400, 'easeOutCirc');
      $this.parent().parent().find('.title').removeClass('active');
      $this.parent().addClass('active');
    }
    return false;
  });
  $('.accordion > .inner').first().show();
  $('.accordion .title').first().addClass('active');
  $(".toggle .title").toggle(function() {
    $(this).addClass("active").closest('.toggle').find('.inner').slideDown(400, 'easeOutCirc');
  },
  function() {
    $(this).removeClass("active").closest('.toggle').find('.inner').slideUp(400, 'easeOutCirc');
  });
  var tabContainers = $('div.tabs > div');
  tabContainers.hide().filter(':first').show();
  $('div.tabs ul.tabNavigation a').click(function() {
    tabContainers.hide();
    tabContainers.filter(this.hash).show();
    $('div.tabs ul.tabNavigation a').removeClass('active');
    $(this).addClass('active');
    return false;
  }).filter(':first').click();
  $(".alert-message a").click(function() {
    $(this).parent().slideUp();
    return false;
  });
  $("#contactForm").validate({
    submitHandler: function(form) {
      $.ajax({
        type: 'POST',
        url: 'php/sendmail.php',
        data: $("#contactForm").serialize(),
        beforeSend: function() {
          $("#contactForm").hide();
          $(".sending").show();
        },
        success: function() {
          $(".sending").hide();
          $(".formOK").show();
        },
        error: function(html) {
          $(".sending").hide();
          $(".formNOK").show();
          $(".formNOK").append(html);
        }
      });
      return false;
    }
  });
});