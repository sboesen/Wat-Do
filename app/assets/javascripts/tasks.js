$(document).ready(function() {
  
  $('#tasks > tbody > tr').live({
    mouseenter:
      function() {
        $('#tasks > tbody > tr > td > span.float-right > a').clearQueue();
        $(this).children('td').children('.float-right').children('a').fadeIn('fast');
      },
    mouseleave:
      function() {
        $('#tasks > tbody > tr > td > span.float-right > a').hide();
      }
  });
});