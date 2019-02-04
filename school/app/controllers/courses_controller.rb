class CoursesController < ApplicationController
    def new 
    end
    
    def create 
        course = Course.new
        course.name = params[:name]
        course.location = params[:location]
        course.description = params[:description]
        course.save
        
        redirect_to "/courses" 
    end
    
    def index
        @courses = Course.all
    end
    
    def edit  
        @course = Course.find(params[:id])
    end
    
    def update 
        course = Course.find(params[:id])
        course.name = params[:name]
        course.location = params[:location]
        course.description = params[:description]
        course.save
        
        redirect_to "/courses"
    end
    
    def destroy
        course = Course.find(params[:id])
        course.destroy
        
        redirect_to "/courses"
    end
    
    def show
        @course = Course.find(params[:id])
    end
end
