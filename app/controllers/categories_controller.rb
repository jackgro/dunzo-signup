class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def edit
  end

  def update
  end

  def destroy
    @category = Category.find(params[:id])
    @user = @category.user
    @category.destroy
    respond_to do |format|
      format.html{ redirect_to user_path(@user) }
      format.js
    end
  end

  def create
    @user = User.find(params[:user_id])
    @category = @user.categories.new(params[:category])
    if @category.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
end
