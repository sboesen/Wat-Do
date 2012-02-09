class TasksController < ApplicationController
  before_filter :requires_login, :menu_urls
  include TasksHelper
#  @links = @links | signin_signout_url
  def index
    @title = "tasks index"
  end
  def derp
    @derp = requires_login
    @state = signed_in?
    @test_url = new_user_url.class
  end
end
