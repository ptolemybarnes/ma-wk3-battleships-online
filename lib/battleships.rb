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
    board.place(Ship.aircraft_carrier, params[:coords].to_sym, params[:direction].to_sym)
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
      query = params.map{|key, value| "#{key}=#{value}"}.join("&")
      redirect to("/boardpage?#{query}")
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
