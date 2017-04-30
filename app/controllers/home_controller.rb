class HomeController < ApplicationController
  # controls homepage finds the last 10 posts
  def index
    @posts = Post.last(10)
  end
end
