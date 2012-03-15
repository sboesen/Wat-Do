<% if @task.new_record? %>
$('#errors').text('<%= @task.errors.full_messages.first %>')
$('#errors').slideDown()
<% else %>
$('table#tasks').show()
$('#errors').slideUp()
$('table#tasks').prepend("<%= escape_javascript(render @task) %>")
$('table#tasks tr#<%= dom_id(@task) %>')
$('#task_description').val('')
<% end %>