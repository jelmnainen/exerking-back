class AuthenticatedUserSerializer < ActiveModel::Serializer

  attributes :id, :email, :access_token, :teacher


end