$(document).ready(function() {
  $('.calTrig').click(function(event) {
    event.preventDefault()
    popoverOptions = {
      content: renderContent,
      trigger: 'manual',
      placement: 'bottom'
    }
    $(this).popover(popoverOptions)
    $(this).popover('toggle')
    var input = $('#popover-input');
    input.keyup(function() {
      var date = input.datetimeparse();
      console.log(date)
      $('.popover-title').text(date.toString());
    })
  });
});

function renderContent() {
  output = '<input type="text" class="input-large popover-input" id="popover-input" placeholder="Enter date"> <br />'
  output += '<div class="popover-buttons">'
  output += '<a class="btn btn-small btn-primary">OK</a>'
  output += '<a class="btn btn-small btn-secondary">Cancel</a>'
  output += '</div>'
  return output
}