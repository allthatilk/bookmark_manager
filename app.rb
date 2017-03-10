ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative './models/link'

class Bookmark_Manager < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret' # Need to lookup what this does

  get '/' do
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
    # erb :'links/index'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(tag: params[:tag])
    link.tag << tag
    link.save
    redirect '/links'
  end

  get '/links' do
p    @links = Link.all
p    @tags = Tag.all
    erb :'links/links'
  end
end
