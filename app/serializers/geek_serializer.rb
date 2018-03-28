class JobSerializer < ActiveModel::Serializer
  attributes :name, :stack, :resume
end