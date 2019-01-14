require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

set :databse, {adapter: "sqlite3", databse: "test.db"}

get "/" do
    "Hello World"
end