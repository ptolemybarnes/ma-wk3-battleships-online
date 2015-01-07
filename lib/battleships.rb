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
    ship  = Ship.aircraft_carrier
    board = Board.new(Cell)
    orientation = params[:direction] == "horizontal" ? :horizontally : :vertically
    board.place(ship, params[:coords].to_sym, orientation)
    erb :boardpage
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end
