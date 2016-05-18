require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('./models/preorders')

get '/preorders/new' do
  erb(:new)
end

get '/preorders' do
  @preorder = Preorder.all
  erb(:index)
end

post '/preorders' do 
  @preorder = Preorder.new(params)
  @preoder.save()
  erb(:create)
end