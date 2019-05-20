class InterestSerializer < ActiveModel::Serializer
  attributes :id, :name, :checked

  def checked
    self.object.checked(@instance_options[:scope][:id])
  end

end
