class Person
	include ActiveModel::Model
	include ActiveModel::Serializers::JSON

	attr_accessor :id, :first_name, :last_name, :birth_date, :height, :weight, :is_admin	

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end

  def attributes
    instance_values
  end
end
