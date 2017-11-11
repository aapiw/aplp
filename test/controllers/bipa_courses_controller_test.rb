require 'test_helper'

class BipaCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bipa_course = bipa_courses(:one)
  end

  test "should get index" do
    get bipa_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_bipa_course_url
    assert_response :success
  end

  test "should create bipa_course" do
    assert_difference('BipaCourse.count') do
      post bipa_courses_url, params: { bipa_course: { location: @bipa_course.location, long: @bipa_course.long, unit: @bipa_course.unit, user_id: @bipa_course.user_id } }
    end

    assert_redirected_to bipa_course_url(BipaCourse.last)
  end

  test "should show bipa_course" do
    get bipa_course_url(@bipa_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_bipa_course_url(@bipa_course)
    assert_response :success
  end

  test "should update bipa_course" do
    patch bipa_course_url(@bipa_course), params: { bipa_course: { location: @bipa_course.location, long: @bipa_course.long, unit: @bipa_course.unit, user_id: @bipa_course.user_id } }
    assert_redirected_to bipa_course_url(@bipa_course)
  end

  test "should destroy bipa_course" do
    assert_difference('BipaCourse.count', -1) do
      delete bipa_course_url(@bipa_course)
    end

    assert_redirected_to bipa_courses_url
  end
end
