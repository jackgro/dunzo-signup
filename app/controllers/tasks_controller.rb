class TasksController < ApplicationController
  def new
  end

  def create
  	@category = Category.find(params[:category_id])
  	@task = @category.tasks.create(params[:task])
  	if @task.save
  		redirect_to :back, notice: "Task created."
  	else
  		# render
  	end
  end
end
