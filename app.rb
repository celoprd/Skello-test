require "sinatra"
require "sinatra/reloader" if development?
require 'sinatra/activerecord'

require_relative "config/application"

set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'


get "/" do
  @title = "Skello Times"
  @posts = Post.ordered_by_ratings
erb :posts
end

post "/posts" do
  @post = Post.new(params[:post])
  if @post.save
    redirect "/"
  else
    erb :new
  end
end

get "/posts/new" do
  @title = "Write a new post"
  @post = Post.new
erb :new
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  @title = @post.title
  @comments = @post.comments.order("created_at DESC")
erb :show
end

post '/posts/:id/comments' do
  id = params[:id]
  post = Post.find(id)
  new_comment = Comment.new(params[:comment])
  new_comment.post = post
  new_comment.save
  redirect "posts/#{post.id}"
end

get '/posts/:id/upvote' do
  id = params[:id]
  upvote_post = Post.find(id)
  upvote_post.vote!
  upvote_post.save
redirect "/"
end


