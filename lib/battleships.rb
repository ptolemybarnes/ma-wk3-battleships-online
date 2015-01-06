require 'sinatra/base'

class BattleShips < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/newgame' do
    @name   = params[:name]
    @p2name = params[:p2name]
    erb :newgame
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
