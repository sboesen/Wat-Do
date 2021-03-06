class TasksController < ApplicationController
  include ApplicationHelper
  before_filter :requires_login, :active_menu_items

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = @user.tasks.all
    @task = @user.tasks.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = @user.tasks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = @user.tasks.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = @user.tasks.find(params[:id])
    @categories = []
    @categories.push ['None',-1]
    @user.categories.each do |category|
      @categories.push [category.name,category.id]
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @user.tasks.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    params.delete :category_id if params[:category_id] == -1
    @task = @user.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = @user.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :ok }
      format.js
    end
  end
end
