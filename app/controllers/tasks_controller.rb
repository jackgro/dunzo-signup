class TasksController < ApplicationController

  before_filter :get_user, only: :destroy
  def new
    @category = Category.find(params[:category_id])
    @task = @category.tasks.new
  end

  def create
    @category = Category.find(params[:category_id])
    @task = @category.tasks.create!(params[:task])

    respond_to do |format|
      format.html {
        if @task.save
          redirect_to :back
        else
          render 'new'
        end
      }
      format.js
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes!(params[:task])

    respond_to do |format|
      format.html {
        if @task.save
          redirect_to :back
        else
          render 'edit'
        end
      }
      format.js
    end
  end

  def destroy
    @task = Task.find(params[:id])

    respond_to do |format|
      @task.destroy

      format.html {
        redirect_to username_category_path(@user.slug)
      }
      format.js
    end
  end

  def sort
    params[:edit_task].each_with_index do |id, index|
      Task.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
