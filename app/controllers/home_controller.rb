class HomeController < ApplicationController
  def index
    if !user_signed_in?
      @resource = User.new
      @resource_name = :user
    end
  end
end
