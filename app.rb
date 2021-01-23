require 'sinatra/base'

class RPS < Sinatra::Base

  enable :sessions
 
  get '/test' do
    'Testing infrastructure working!'
  end

  get '/' do
    erb :index
  end

  post '/names' do 
    session[:P1] = params[:P1]
    session[:P2] = params[:P2]
    redirect '/play' 
  end

  get '/play' do 
    @player_1 = session[:P1]
    @player_2 = session[:P2]
    erb :play
  end

  get '/move' do 
    @player_1 = session[:P1]
    @player_2 = session[:P2]
    erb :move
  end

  run! if app_file == $0
end