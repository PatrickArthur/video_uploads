class Api::PostsController < ApplicationController
  before_filter :authenticate_user!

  def destroy
    if post.destroy
      render json: post
    else
      error = "errors"
      render json: error
    end
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end
end
