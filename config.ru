require 'rubygems'
require File.join(File.dirname(__FILE__), 'lib/battleships.rb')

use Rack::Static, :urls => ['/stylesheets', '/javascripts'], :root => '/public'

run BattleShips