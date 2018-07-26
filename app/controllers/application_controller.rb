class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    helper_method :current_chef, :logged_in?
    #This is to make these methods be available in views for using

    ## these methods are now available to all controllers
    def current_chef
       @current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
       
       # if current_chef already is there, return it. Else, find the session if chef_id exists in session
    end

    def logged_in?
        !!current_chef
        
        #return true or false
    end
    
    def require_user
        if !logged_in?
            flash[:danger] = "You must be logged in to perform this action"
            redirect_to root_path
        end
    end

end
