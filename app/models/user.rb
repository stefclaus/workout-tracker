class User < ActiveRecord::Base
  has_secure_password
  has_many :yogaclasses

  def slug
    username.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

end
