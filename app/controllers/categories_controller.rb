class CategoriesController < ApplicationController

  respond_to :html, :json

  has_mobile_fu

  def new
    @category = Category.new
  end

  def update
    @category = Category.find(params[:id]) || current_user.categories.find_by_slug(params[:slug])

    if @category.update_attributes(params[:category])
       respond_with_bip(@category)
    else
       respond_with_bip(@category)
    end
  end

  def show
    @user =  current_user || User.find_by_slug(params[:user_slug])
    @categories = @user.categories.all
    @category = @user.categories.find_by_slug(params[:slug]) || Category.find(params[:id])
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
      format.html{ redirect_to username_path(@user.slug) }
      format.js
    end

  end

  def create
    @user = User.find(params[:user_id])
    @category = @user.categories.create(params[:category])

    if @category.save
      redirect_to username_path(@user.slug)
    else
      render 'new'
    end
  end
end
