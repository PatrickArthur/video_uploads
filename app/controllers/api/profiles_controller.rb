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
    post = profile.posts.last
    if post.present?
      render json: post
    else
      error = "errors"
      render json: error
    end
  end

  def profile_posts
    prof_posts = []
    profile.posts.each do |post|
      prof_posts << profile.avatar
      prof_posts << post
    end
    if prof_posts.present?
      render json: prof_posts
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
