require 'sinatra'
require 'erb'

set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  erb :index
end

post '/signin' do
  unless params[:team].nil?
    redirect "/#{params[:team]}", 303
  end
end

post '/signup' do
  unless params[:team].nil?
    redirect "/#{params[:team]}", 303
  end
end

get '/:team' do
  #"hello #{params[:team]}"
  erb :board                                                                                                                     
end

get '/:team/profile' do
  "hello! #{params[:team]}"
end
