class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def thankyou
    render 'home/thankyou'
  end

  def not_found
    rescue ActiveRecord::RecordNotFound
      @first = @user.categories.includes(:tasks).first
      redirect_to username_category_path(@user.slug, @first.category_uid)
  end

  private

    def get_user
      @user ||=  User.find_by_slug(params[:user_slug]) || current_user
    end

end
