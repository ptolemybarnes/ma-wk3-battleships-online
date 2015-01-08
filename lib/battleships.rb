require 'sinatra/base'
require_relative 'ship'
require_relative 'board'
require_relative 'cell'

class BattleShips < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/newgame' do
    @name   = params[:name]
    @p2name = params[:p2name]
    erb :newgame
  end

  get '/fleetlauncher' do
    erb :fleetlauncher
  end

  get '/boardpage' do
   @board = Board.new(Cell)
   @id = @board.object_id
   @keys = @board.grid.keys
   erb :boardpage
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end
