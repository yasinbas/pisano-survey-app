class UserDetailSerializer < UserSerializer
  attributes :last_sign_in_at, :sign_in_count, :surveys_count

  has_many :surveys, serializer: SurveySerializer

  def surveys_count
    object.surveys.count
  end
end 