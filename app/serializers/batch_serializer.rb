class BatchSerializer < ActiveModel::Serializer

  attributes :id, :title, :deadline
  has_many :exercises, embed: :ids

end