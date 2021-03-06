class CategoriesController < ApplicationController
  rescue_from NoMethodError, :with => :method_not_found

  before_filter :get_user,        except: [:new, :edit]
  before_filter :user_categories, except: [:new, :edit]
  before_filter :find_category, only: [:edit, :update, :destroy]

  has_mobile_fu

  respond_to :html, :js

  def set_mobile_format
    is_device?("ipad") ? request.format = :js : super
  end

  def new
    @category = Category.new
  end

  def edit
    # Category found by before_filter method
    respond_to do |format|
      format.html
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

    if params.include?(:category_uid)
      @category = @user_categories.find_by_category_uid(params[:category_uid])
    else
      @category = @user_categories.last
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

    def method_not_found(exception = nil)
      logger.info "Exception, redirecting: #{exception.message}" if exception
      if is_mobile_device?
        redirect_to root_path, alert: 'Sorry. The list you asked for is unavailable.'
      else
        redirect_to root_path, alert: 'Sorry. The list you asked for is unavailable. Either the URL was incorrect or the list has been deleted.'
      end
    end

end
