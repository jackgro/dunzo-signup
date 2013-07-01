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
      @first = @user.lists.includes(:tasks).first
      redirect_to username_list_path(@user.slug, @first.uid)
  end

  private

    def get_user
      @user ||= current_user
    end

end
