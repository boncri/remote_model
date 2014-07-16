class Person
  include Intersail::RemoteModels::RemoteModel

	remote_attributes :id, :first_name, :last_name, :birth_date, :height, :weight, :is_admin
end
