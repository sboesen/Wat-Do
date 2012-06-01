$(document).ready(function() {
  if ($('div.white > ul').children().size() > 0) $('.note-box').show();
  $('div.white > ul > li').live({
    mouseenter:
      function() {
        $('div.white > ul > li > .task-done').clearQueue();
        console.log($('div.white > ul > li > .task-done'))
        $(this).children('.task-done').fadeIn('fast');
      },
    mouseleave:
      function() {
        $('div.white > ul > li > .task-done').hide();
      }
  });
});