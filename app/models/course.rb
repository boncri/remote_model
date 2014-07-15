class Course < ActiveRecord::Base
  include RemoteAssociable

  self.site = 'http://192.168.1.131/JsonService/ReadEntity.aspx'

  has_one_remote :teacher, class: Person, name: :person

  # has_many :course_students
  #
  # has_many_remote :students, class: Person, through: :course_student, name: :person


  def students
    # Get course_students...
                                                ∞
  end
end