class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/,
                                             default_url: '/images/:style/missing.png',
                                             convert_options: { all: '-quality 80' }

  def index_hash(hash)
    array = []
    posts.each do |post|
      array += [avatar, post.post, post.created_at]
      hash[post.id] = array
      array = []
    end
  end

  def output_hash(hash)
    array = []
    last_post = posts.last
    array = [avatar, last_post.post, last_post.created_at]
    hash[last_post.id] = array
  end
end
