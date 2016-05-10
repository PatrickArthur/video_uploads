class Api::ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def post_inputs
    profile_post = profile.posts.create(post: params[:post])
    if profile_post.present?
      render json: profile_post
    else
      error = "errors"
      render json: error
    end
  end

  def post_outputs
    posts = profile.posts
    if posts.present?
      render json: posts
    else
      error = "errors"
      render json: error
    end
  end

  private

  def profile
    @profile ||= Profile.find(params[:id])
  end
end
