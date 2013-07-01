class ListsController < ApplicationController
  rescue_from NoMethodError, :with => :method_not_found

  before_filter :get_user,        except: [:new, :edit]
  before_filter :user_lists, except: [:new, :edit]
  before_filter :find_list, only: [:edit, :update, :destroy]

  has_mobile_fu

  respond_to :html, :js

  def set_mobile_format
    is_device?("ipad") ? request.format = :js : super
  end

  def new
    @list = List.new
  end

  def edit
    # list found by before_filter method
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    # list found by before_filter method
    @lists = @user_lists.order('created_at ASC')

    if @list.update_attributes(params[:list])
      redirect_to username_list_path(@user.slug, @list.uid)
    else
      render 'edit'
    end
  end

  def show
    @lists = @user_lists.order('created_at ASC')
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    if params.include?(:uid)
      @list = @user_lists.find_by_uid(params[:uid])
    else
      @list = @user_lists.last
    end

  end

  def destroy
    # list found by before_filter method
    @list.destroy
    @last = @user_lists.last
    @link = username_list_path(@user.slug, @last.uid)

    respond_to do |format|
      format.html{ redirect_to @link }
      format.js { render :js => "window.location.href = '#{@link}'" }
    end

  end

  def create
    @list = @user.lists.new(params[:list])

    if @list.save
      redirect_to username_list_path(@user.slug, @list.uid)
    else
      render 'new'
    end
  end

  private

    def user_lists
      @user_lists ||= @user.lists.includes(:tasks)
    end

    def find_list
      @list ||= List.find(params[:id])
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
