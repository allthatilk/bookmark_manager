ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require './models/datamapper_config'

class Bookmark_Manager < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret' # Need to lookup what this does

  get '/' do
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(name: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links' do
p    @links = Link.all
p    @tags = Tag.all
    erb :'links/links'
  end

  get '/tags/search' do
    p params
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    p @links
    erb :'links/links'
  end
end
