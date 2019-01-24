require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "test.db"}

class Contact < ActiveRecord::Base
end


get "/contacts" do
    @contacts = Contact.all
    
    erb :contacts
end

get "/contacts/add" do
    
    erb :add_contact
        
end

post "/contacts" do
   contact = Contact.new
   contact.id = params[:id]
   contact.first_name = params[:first_name]
   contact.last_name = params[:last_name]
   contact.phone = params[:phone]
   contact.email = params[:email]
   contact.address = params[:address]
   contact.city = params[:city]
   contact.state = params[:state]
   contact.zip = params[:zip]
   contact.save
   
   redirect "/contacts"
end

get "/contacts/edit" do
    @contact = Contact.find(params[:id])
    
    erb :edit_contact
end

post "/contacts/edit" do
   contact = Contact.find(params[:id])
   contact.first_name = params[:first_name]
   contact.last_name = params[:last_name]
   contact.phone = params[:phone]
   contact.email = params[:email]
   contact.address = params[:address]
   contact.city = params[:city]
   contact.state = params[:state]
   contact.zip = params[:zip]
   contact.save

    redirect "/contacts"
end


get "/contacts/delete" do
    @contact = Contact.find(params[:id])
    @contact.destroy 
    
    redirect "/contacts"
end

get "/contacts/search" do
    @search = params[:search]
    search = "%#{params[:search]}"
    @contacts = Contact.where("first_name LIKE ? OR last_name LIKE ?", search, search)
    
    erb :search_contacts
end