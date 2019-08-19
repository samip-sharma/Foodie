class CommentSerializer < ActiveModel::Serializer
  attributes :id, :context
  has_one :user
  has_one :restaurant
end
