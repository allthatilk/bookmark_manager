require 'sinatra/base'
require_relative './models/link'

class Bookmark_Manager < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret' # Need to lookup what this does

  get '/' do
    erb :'links/index'
  end

  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end

  get '/links' do
p    @links = Link.all
    erb :'links/links'
  end
end
