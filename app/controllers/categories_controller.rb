class CategoriesController < ApplicationController
  def new
    # @user = User.find params[:id]
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
    redirect_to user_path(@user), notice: "Category destroyed."
  end

  def create
    @user = User.find(params[:user_id])
    @category = @user.categories.create(params[:category])
    if @category.save
      redirect_to user_path(@user), notice: "Category created."
    else
      render 'new'
    end
  end
end
