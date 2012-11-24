class TasksController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @task = @category.tasks.new
  end

  def create
  	@category = Category.find(params[:category_id])
    @user = @category.user
  	@task = @category.tasks.create(params[:task])
    respond_to do |format|
      format.html { 
        if @task.save
          redirect_to user_path(@user), notice: "Task created."
        else
          render 'new'
        end
      }
      format.js
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
    @user = @category.user
    @task.destroy
    redirect_to user_path(@user)
  end
end
