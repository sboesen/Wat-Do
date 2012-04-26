$(document).ready(function() {
  
  $('table > tbody > tr').hover(function() {
    $(this).children('td').children('.float-right').children('a').fadeIn();
  },
  function() {
    $('#tasks > tbody > tr > td > span.float-right > a').hide();
  }
  );
});