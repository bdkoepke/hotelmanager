class ApplicationController < ActionController::Base
  protect_from_forgery
<<<<<<< HEAD
=======
  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
    ## this render call should be:
    # render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end

>>>>>>> 0456d704fc81140d9e461b4d934b862b91815b5e
end
