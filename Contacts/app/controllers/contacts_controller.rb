class ContactsController < ApplicationController
    def index
        @contacts = Contact.all
    end

    def new
    end
    
    def edit
        @contact = Contact.find_by(params[:id])
    end
    
    def create
        @contact = Contact.new
        @contact.first_name = params[:first_name]
        @contact.last_name = params[:last_name]
        @contact.phone = params[:phone]
        @contact.address = params[:address]
        @contact.city = params[:city]
        @contact.state = params[:state]
        @contact.zip = params[:zip]
        @contact.save
        
        redirect_to "/contacts"
    end
    
    def update
        @contact = Contact.find_by(params[:id])
        @contact.first_name = params[:first_name]
        @contact.last_name = params[:last_name]
        @contact.phone = params[:phone]
        @contact.address = params[:address]
        @contact.city = params[:city]
        @contact.state = params[:state]
        @contact.zip = params[:zip]
        @contact.save
        
        redirect_to "/contacts"
    end

    def search
        @search = "%#{params[:search]}%"
        @contacts = Contact.where("first_name LIKE ? OR last_name LIKE ?", search, search)
    end
    
    def delete
        @contact = Contact.find(params[:id])
        @contact.destroy
        
        redirect_to "/contacts"
    end
end
