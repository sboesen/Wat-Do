<% if @task.new_record? %>
$('#errors').text('<%= @task.errors.full_messages.first %>')
$('#errors').slideDown()
<% else %>
$('.note-box').show()
$('#errors').slideUp()
$('div.white ul').prepend('<%= escape_javascript(render @task) %>')
$('#task_description').val('')
<% end %>