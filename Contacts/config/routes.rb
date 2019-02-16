Rails.application.routes.draw do
  get "/contacts" => "contacts#index"
  get "/contacts/new" => "contacts#new"
  get "/contacts/edit" => "contacts#edit"
  post "/contacts" => "contacts#create"
  post "/contacts/update" => "contacts#update" 
  get "/contacts/search" => "contacts#search"
  get "/contacts/delete" => "contacts#delete"
end
