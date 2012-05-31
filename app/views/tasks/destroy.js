$('li#<%= @task.id %>').remove();
if ( $('div.white ul').children().size() == 0) {
  $(".note-box").hide()
}
