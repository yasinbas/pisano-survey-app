class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :role, :created_at

  def created_at
    object.created_at.iso8601
  end
end 