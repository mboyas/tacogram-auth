class PostsController < ApplicationController

    def index
      @posts = Post.where({ user_id: session[:user_id] })
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(params["post"])
      @post.user_id = @current_user.id
      @post.save
      redirect_to "/posts"
    end
  
  end