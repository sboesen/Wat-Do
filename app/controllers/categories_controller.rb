class CategoriesController < ApplicationController
  # include ApplicationHelper
  before_filter :requires_login, :active_menu_items

  def index
    @category = Category.new
    @categories = @user.categories
    @colors = Color.all

  end

  def new
    @category = Category.new
  end

  def create
    @category = @user.categories.new(params[:category])
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def destroy
    @category = @user.categories.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :ok }
      format.js
    end
  end

end
