class StudentsController < ApplicationController
    
    def new
        @courses = Course.all
    end
    
    def create
        student = Student.new
        student.first_name = params[:first_name]
        student.last_name = params[:last_name]
        student.picture = params[:picture]
        student.course_id = params[:course_id]
        student.save
        
        redirect_to "/students"
    end
    
    def index
        @students = Student.all
    end
    
    def edit
        
    end
    
    def update
        @student = Student.find(params[:id])
        @student.first_name = params[:first_name]
        @student.last_name = params[:last_name]
        @student.picture = params[:picture]
        @student.course_id = params[:course_id]
        student.save
        
        redirect_to "/students"
    end
    
    def delete
        @student = Student.find(params[:id])
        student.destoy
        
        redirect_to "/students"
        
    end
end
