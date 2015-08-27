require 'sinatra'

require './lib/haiku_basho.rb'

configure :development do
  require "sinatra/reloader"
  also_reload './lib/*'
end

helpers do
  def get_random_haiku
    Haiku.new.get_random
  end
end

get '/' do
  @haiku = get_random_haiku
  haml :index
end
