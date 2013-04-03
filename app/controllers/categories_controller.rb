class CategoriesController < ApplicationController

  respond_to :html, :json

  has_mobile_fu
  def index
    @user =  User.find_by_slug(params[:user_slug]) || current_user
    @categories = @user.categories.order('created_at ASC')
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    respond_to do |format|
      format.js
    end
  end

  def new
    @category = Category.new
  end

  def update
    @category = current_user.categories.find_by_category_uid(params[:category_uid]) || Category.find(params[:id])
    @categories = current_user.categories.order('created_at ASC')

    if @category.update_attributes(params[:category])
       respond_with_bip(@category)
    else
       respond_with_bip(@category)
    end
  end

  def show
    @user =  User.find_by_slug(params[:user_slug]) || current_user
    @categories = @user.categories.order('created_at ASC')
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    if !params.include?(:category_uid)
      @category = @user.categories.first
    else
      @category = @user.categories.find_by_category_uid(params[:category_uid])
    end

    if is_mobile_device?
      render 'show.mobile.haml'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    @user = @category.user
    @first_cat = @user.categories.first

    respond_to do |format|
      format.html{ redirect_to username_category_path(@user.slug, @first_cat.category_uid ) }
      format.js
    end

  end

  def create
    @user = User.find(params[:user_id])
    @category = @user.categories.create(params[:category])
    @category.set_category_uid

    if @category.save
      redirect_to username_category_path(@user.slug, @category.category_uid)
    else
      render 'new'
    end
  end
end
