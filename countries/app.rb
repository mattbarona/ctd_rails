require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "test.db"}

class Question < ActiveRecord::Base
end

get "/questions" do
    @questions = Question.all
    erb :questions
end

get "/questions/new" do
    erb :new    
    
end 

post "/questions" do
    question = Question.new
    question.question = params[:question]
    question.answer = params[:answer]
    question.flag = params[:flag]
    question.save 
    
    redirect "/questions"
end


get "/questions/edit" do
    @question = Question.find(params[:id])
    
    erb :edit
end

post "/questions/edit" do
    @question = Question.find(params[:id])
    @question.question = params[:question]
    question.answer = params[:answer]
    question.flag = params[:flag]
    question.save
    
    redirect "/questions"
    
end

get "/random" do
    @question = Question.all
    random = rand(@question.length)
    @rand_question = @question[random]
    
    erb :guess
end 

get "/answer" do
    @question = Question.find(params[:id])

    erb :answer
end