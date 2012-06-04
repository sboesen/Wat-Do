module ApplicationHelper
  def active_menu_items
    #get all the active menu items
    #params[:controller] == 'tasks'
    #params[:action] == 'index'
    case params[:controller]
    when 'tasks'
      @tasks_active = true
    when 'categories'
      @account_active = true
    when 'sessions'
      @signup_active = true
    when 'schmerp'
      @help_active = true
    end
  end
  def item_active(item)
    if item.nil?
      "<li>"
    else
      "<li class=\"active\">"
    end
  end
end
