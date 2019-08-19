class UserSerializer < ActiveModel::Serializer
  attributes :id,:name,:restaurants, :functiontest

  def functiontest
    "hello"
  end
end
