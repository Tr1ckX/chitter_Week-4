require 'sinatra/base'
require 'data_mapper'
require './lib/message.rb'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
  set :views,  Proc.new { File.join(root, "views") }
  get '/' do
    @messages = Message.all
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
