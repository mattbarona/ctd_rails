class UsersController < ApplicationController
    
    def index
        @users = Users.all
    end
    
    def show
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new
        @user.first_name = params[:user][:first_name]
        @user.last_name = params[:user][:last_name]
        @user.email = params[:user][:email]
        @user.picture = params[:user][:picture]
        @user.save
        redirect_to '/users'
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.first_name = params[:user][:first_name]
        @user.last_name = params[:user][:last_name]
        @user.email = params[:user][:email]
        @user.picture = params[:user][:picture]
        @user.save
        redirect_to '/users'
    end

    def delete
    end

end
