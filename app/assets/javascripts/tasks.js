$(document).ready(function() {
  
  $('.calTrig').click(displayDateTimeInputPopoverBottom);
  $('#task_description').keypress(eventHandler);
  $('#task_date').focusin(displayDateTimeInputPopoverTop);
  $('#task_date').focusout(function() {
    $('#task_date').popover('hide');
  });
  $('#task_place').keypress(eventHandler);
  $('#task_date').keypress(eventHandler);
  $('button').click(function(event) {
    console.log("Got click")
    var buttonClicked = $(this);
    if (buttonClicked.hasClass('active')) return;
    event.preventDefault();
    $('button').removeClass('active');
    buttonClicked.addClass('active');
    $('.input-append > input:visible').toggle({duration: 300}); //hide
    var derp = buttonClicked.next('input')
    console.log(derp)
    derp.toggle({duration: 300}).focus(); //show
  });
});



function displayDateTimeInputPopoverTop(event) {
  popoverOptions = {
    content: renderContentMainInput,
    trigger: 'manual',
    placement: 'top'
  }
  $(this).popover(popoverOptions)
  $(this).popover('toggle')
  $('.popover').css({
    'top' : '168px',
    'left': '305.5px'
  });
  var input = $('#task_date');
  input.keyup(function() {
    var date = input.datetimeparse();
    console.log(date)
    $('#input-here').text(date.toString());
  })
  $('#task_date').trigger('keyup')
  
};
function renderContentMainInput() {
  output = '<div id="input-here"></div>';
  return output
}
function displayDateTimeInputPopoverBottom(event) {
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
};
function eventHandler(event) {
  var char = String.fromCharCode(event.keyCode);
  if (char == '!') {
    //! sign. So... go to task_description
    event.preventDefault();
    $('button').removeClass('active');
    $('#btn-description').addClass('active');
    $(this).toggle({duration: 300});//hide
    $('#task_description').toggle({duration: 300}).focus();;//show
  }
  else if (char == '@') {
    //@ sign. So... go to task_date
    event.preventDefault();
    $('button').removeClass('active');
    $('#btn-date').addClass('active');
    $(this).toggle({duration: 300});//hide  
    $('#task_date').toggle({duration: 300}).focus();//show

  }
  else if (char == '#') {
    //# sign. So... go to task_place
    event.preventDefault();
    $('button').removeClass('active');
    $('#btn-place').addClass('active');
    $(this).toggle({duration: 300});//hide
    $('#task_place').toggle({duration: 300}).focus();;//show
  }
}

function renderContent() {
  output = '<input type="text" class="input-large popover-input" id="popover-input" placeholder="Enter date"> <br />'
  output += '<div class="popover-buttons">'
  output += '<a class="btn btn-small btn-primary">OK</a>'
  output += '<a class="btn btn-small btn-secondary">Cancel</a>'
  output += '</div>'
  return output
}