class SessionsController < ApplicationController
    def new
    
    end
   
    def create
        chef = Chef.find_by(email: params[:session][:email].downcase)
        if chef && chef.authenticate(params[:session][:password])
                
            session[:chef_id] = chef.id
            #session is holding the encrypted chef id for use later
            flash[:success] = "You have successfully logged in"
            redirect_to chef_path(chef)
            #shortform of chef_path(chef) is redirect_to chef
        else
            flash.now[:danger] = "Your username or password did not match"
            render 'new'
        end    
    
    end
       
    def destroy
        session[:chef_id] = nil
        flash[:success] = "You have logged out"
        redirect_to root_path
    end

end