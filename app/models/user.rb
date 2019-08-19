class User < ApplicationRecord
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users
    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users
    has_many :user_restaurants ,dependent: :destroy
    has_many :restaurants , through: :user_restaurants

    has_secure_password
    validates_presence_of :user_name
    validates_uniqueness_of :user_name
end
