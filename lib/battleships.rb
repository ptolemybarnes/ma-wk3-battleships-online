require 'sinatra/base'
require_relative 'ship'
require_relative 'board'
require_relative 'cell'
require_relative 'water'
require_relative 'game'

class BattleShips < Sinatra::Base
enable :sessions

game = Game.new
board = Board.new(Cell)
board.grid.each {|coord, cell| cell.content = Water.new }

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
   if params[:shot]
      board.shoot_at(params[:shot].to_sym)
   end

   @keys = board.grid.keys
   erb :boardpage
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end
