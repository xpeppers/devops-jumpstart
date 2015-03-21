require 'rubygems'
require 'bundler/setup'
require 'sinatra/base'
require 'sinatra/activerecord'
require './models/post'
require 'rack-flash'

Tilt.register Tilt::ERBTemplate, 'html.erb'

class Blog < Sinatra::Base
  use Rack::MethodOverride
  use Rack::Session::Cookie, secret: '792bbbc3d7e98b884cbe53f643b104e944139bda5257f3b915c1033f0ff5815dfc67feac066b46ed6e449c554990faf1fab68c8a7aa001023ab6c5079795306a'
  use Rack::Flash

  get '/' do
    redirect to('posts')
  end

  get '/posts' do
    @posts = Post.order('created_at DESC')
    erb :'posts/index'
  end

  get '/posts/new' do
    @post = Post.new
    erb :'posts/new'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'posts/show'
  end

  post '/posts' do
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = 'Post successfully created!'
      redirect to("posts/#{@post.id}")
    else
      flash[:error] = 'Error while creating post'
      redirect to('/posts/new')
    end
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'posts/form'
  end

  put '/posts/:id' do
    @post = Post.find(params[:id])
    if @post.update(params[:post])
      flash[:notice] = 'Post successfully updated'
      redirect to("/posts/#{@post.id}")
    else
      flash[:error] = 'Error while updating post'
      redirect to('/posts/form')
    end
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = 'Post successfully deleted'
      redirect to('/posts')
    else
      flash[:error] = 'Error while deleting post'
      redirect to('/posts/form')
    end
  end
end
