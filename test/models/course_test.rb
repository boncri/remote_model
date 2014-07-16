require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @course = Course.create(name: 'Test', teacher_id: 1)
  end

  test "A course with teacher_id = 1 must have one teacher named PAOLINO PAPERINO" do
    c = @course
    assert_not_nil c.teacher
    assert_equal 1, c.teacher.id
    assert_equal 'PAOLINO', c.teacher.first_name
    assert_equal 'PAPERINO', c.teacher.last_name
  end

  test "A course with two subscriptions must have two students" do
    c = @course

    c.subscriptions.create(student_id: 2)
    c.subscriptions.create(student_id: 3)

    assert_equal 2, c.students.count
    assert_equal 'PIPPO', c.students[0].first_name
    assert_equal 'MICKEY', c.students[1].first_name
    assert_equal 2, c.students[0].id
    assert_equal 3, c.students[1].id
  end

  test "Change teacher_id to a course muse reset teacher field" do
    c= @course

    assert_not_nil c.teacher

    c.teacher_id = 20

    assert_nil c.teacher

    c.teacher_id = 1

    assert_not_nil c.teacher
  end
end
