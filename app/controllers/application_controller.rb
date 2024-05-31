class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.admin?
      order_path
    else
      public_items_path
    end
  end
end
