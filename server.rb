require 'sinatra/base'
require 'data_mapper'
require './lib/message.rb'
require './lib/user.rb'
require_relative './helpers'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
  set :views,  Proc.new { File.join(root, "views") }
  set :public_folder, Proc.new { File.join(root, "public_folder") }
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @messages = Message.all
    erb :index
  end

  post '/messages' do
    message = params["text"]
    Message.create(:text => message)
    redirect to('/')
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(:user_name => params[:user_name],
    :name => params[:name],
    :email => params[:email],
    :password => params[:password])
    session[:user_id] = user.id
    redirect to('/')
  end

  helpers Helpers

  # start the server if ruby file executed directly
  run! if app_file == $0
end
