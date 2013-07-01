class TasksController < ApplicationController

  before_filter :get_user, only: :destroy
  before_filter :find_list, only: [:new, :create]
  before_filter :find_task, only: [:update, :destroy]

  def new
    # List found by before_filter method
    @task = @list.tasks.new
  end

  def create
    # List found by before_filter method
    @task = @list.tasks.create!(params[:task])

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
    # Task found by before_filter method
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
    # Task found by before_filter method
    respond_to do |format|
      @task.destroy

      format.html { redirect_to username_list_path(@user.slug) }
      format.js
    end
  end

  def sort
    params[:edit_task].each_with_index do |id, index|
      Task.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

  private

    def find_list
      @list ||= List.find(params[:list_id])
    end

    def find_task
      @task ||= Task.find(params[:id])
    end
end
