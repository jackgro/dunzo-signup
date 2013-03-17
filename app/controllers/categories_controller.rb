class CategoriesController < ApplicationController

  has_mobile_fu

  def new
    @category = Category.new
  end

  def edit
  end

  def update
  end

  def show
    @user =  current_user || User.find_by_username(params[:username])
    @categories = @user.categories.all
    @category = @user.categories.find_by_name(params[:name]) || Category.find(params[:id])
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    if is_mobile_device?
      render 'show.mobile.haml'
    end

  end

  def destroy
    @category = Category.find(params[:id])
    @user = @category.user
    @category.destroy

    respond_to do |format|
      format.html{ redirect_to username_path(@user) }
      format.js
    end

  end

  def create
    @user = User.find(params[:user_id])
    @category = @user.categories.create(params[:category])

    if @category.save
      redirect_to username_path(@user.username)
    else
      render 'new'
    end
  end
end
