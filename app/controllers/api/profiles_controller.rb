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
    post = create_post_hash(profile, "output")
    if post.present?
      render json: post
    else
      error = "errors"
      render json: error
    end
  end

  def profile_posts
    posts = create_post_hash(profile, "index")
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

  def create_post_hash(profile,action)
    @hash = {}
    if action == "index"
      pop_index_hash(profile,@hash)
    else
      pop_output_hash(profile,@hash)
    end
    return @hash
  end

  def pop_index_hash(profile,hash)
    array = []
    profile.posts.each do |post|
      array += [profile.avatar, post.post, post.created_at]
      hash[post.id] = array
      array = []
    end
  end

  def pop_output_hash(profile,hash)
    array = []
    last_post = profile.posts.last
    array += [profile.avatar, last_post.post, last_post.created_at]
    hash[profile.posts.last.id] = array
  end
end
