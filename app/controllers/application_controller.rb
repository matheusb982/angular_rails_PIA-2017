class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout :out_angular
  protect_from_forgery with: :exception

  def out_angular
    if devise_controller?
      'out_angular'
    else
      'application'
    end
  end
end
