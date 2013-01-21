class TasksController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @task = @category.tasks.new
  end

  def create
    @category = Category.find(params[:category_id])
    @user = @category.user
    @task = @category.tasks.create(params[:task])
    redirect_to :back

    #respond_to do |format|
      #format.html {
        #if @task.save
          #redirect_to :back
        #else
          #render 'new'
        #end
      #}
      #format.js
    #end
  end

  def update
    @category = Category.find(params[:category_id])
    @user = @category.user
    @task = @category.tasks.create(params[:task])

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

  def destroy
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
    @user = @category.user
    respond_to do |format|
    @task.destroy
      format.html {
        redirect_to user_path(@user)
      }
      format.js
    end
  end
end
