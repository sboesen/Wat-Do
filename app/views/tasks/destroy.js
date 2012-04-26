$('#<%= dom_id(@task) %>').remove();
if ( $('table#tasks').size() == 0) {
  $("table#tasks").hide() 
}
