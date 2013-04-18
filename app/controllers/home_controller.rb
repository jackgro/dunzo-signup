class HomeController < ApplicationController

  has_mobile_fu

  def index
    @user = User.new
  end
end
