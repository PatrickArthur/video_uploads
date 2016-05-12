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
    posts = create_post_hash(profile)
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

  def create_post_hash(profile)
    hash = {}
    array = []
    profile.posts.each do |post|
      array += [profile.avatar, post.post, post.created_at]
      hash[post.id] = array
      array = []
    end
    return hash
  end
end
