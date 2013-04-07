class CategoriesController < ApplicationController

  before_filter :get_user,        except: [:new, :edit]
  before_filter :user_categories, except: [:new, :edit]
  before_filter :find_category, only: [:edit, :update, :destroy]

  respond_to :html, :json

  has_mobile_fu

  def set_mobile_format
    is_device?("ipad") ? request.format = :html : super
  end

  def new
    @category = Category.new
  end

  def edit
    # Category found by before_filter method

    respond_to do |format|
      format.js
    end
  end

  def update
    # Category found by before_filter method

    @categories = @user_categories.order('created_at ASC')

    if @category.update_attributes(params[:category])
      redirect_to username_category_path(@user.slug, @category.category_uid)
    else
      render 'edit'
    end
  end

  def show
    @categories = @user_categories.order('created_at ASC')
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    if !params.include?(:category_uid)
      @category = @user_categories.last
    else
      @category = @user_categories.find_by_category_uid(params[:category_uid])
    end

  end

  def destroy
    # Category found by before_filter method

    @category.destroy
    @last = @user_categories.last
    @link = username_category_path(@user.slug, @last.category_uid)

    respond_to do |format|
      format.html{ redirect_to @link }
      format.js { render :js => "window.location.href = '#{@link}'" }
    end

  end

  def create
    @category = @user.categories.new(params[:category])
    @category.set_category_uid

    if @category.save
      redirect_to username_category_path(@user.slug, @category.category_uid)
    else
      render 'new'
    end
  end

  private

    def user_categories
      @user_categories ||= @user.categories.includes(:tasks)
    end

    def find_category
      @category ||= Category.find(params[:id])
    end

end
