class Course < ActiveRecord::Base
  include RemoteAssociable

  self.site = 'http://192.168.1.131/JsonService/ReadEntity.aspx'

  has_one_remote :teacher, name: :person

  has_many :subscriptions
  has_many_remote :students, through: :subscriptions, name: :person
end
