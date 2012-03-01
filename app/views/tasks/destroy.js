$('#<%= dom_id(@task) %>').fadeOut()
if ( $('table#tasks').size() == 0) {
  $("table#tasks").hide() 
}
