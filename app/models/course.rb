class Course < ActiveRecord::Base
  include Intersail::RemoteModels::RemoteAssociable

  self.site = 'http://sail2p/JsonService/ReadEntity.aspx'

  has_one_remote :teacher, name: :person

  has_many :subscriptions
  has_many_remote :students, through: :subscriptions, name: :person
end
