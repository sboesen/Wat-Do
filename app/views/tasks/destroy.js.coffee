$('#<%= dom_id(@task) %>').fadeOut()
$("table#tasks").hide() if ( $('table#tasks').size() == 0)
