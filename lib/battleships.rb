require 'sinatra/base'
require_relative 'ship'
require_relative 'board'
require_relative 'cell'
require_relative 'water'
require_relative 'game'
require 'byebug'

class BattleShips < Sinatra::Base
  set :public_dir, Proc.new{File.join(root, '..', "public")}
  set :public_folder, 'public'
  enable :sessions
  

  game = Game.new
  board = Board.new(Cell)
  board.grid.each {|coord, cell| cell.content = Water.new }
  fleet1 = {"Aircraftcarrier" => Ship.aircraft_carrier,
            "Battleship"      => Ship.battleship, 
            "Destroyer"       => Ship.destroyer, 
            "Submarine"       => Ship.submarine, 
            "Patrolboat"      => Ship.patrol_boat}

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

  get '/boardset' do
    type = fleet1[params[:shiptype]]
    board.place(type, params[:coords].to_sym, params[:direction].to_sym)
    redirect to('/boardpage')
  end

  get '/boardpage' do
    @keys = board.grid.keys
    erb :boardpage
  end

  post '/boardpage' do
    begin
      board.shoot_at(params[:shot].to_sym)
      params[:miss_shot] = board.grid[params[:shot].to_sym].content.is_a?(Ship) ? false : true
      params[:same_shot_error] = false
    rescue RuntimeError
      params[:same_shot_error] = true 
    end
      redirect to('/victory') unless board.floating_ships?

      query = params.map{|key, value| "#{key}=#{value}"}.join("&")
      redirect to("/boardpage?#{query}")
  end

  get '/victory' do
    "ALL ENEMY SHIPS SUNK, YOU WIN!"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
