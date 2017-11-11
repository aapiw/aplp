require 'test_helper'

class ToIndonesiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @to_indonesium = to_indonesia(:one)
  end

  test "should get index" do
    get to_indonesia_url
    assert_response :success
  end

  test "should get new" do
    get new_to_indonesium_url
    assert_response :success
  end

  test "should create to_indonesium" do
    assert_difference('ToIndonesium.count') do
      post to_indonesia_url, params: { to_indonesium: { destination: @to_indonesium.destination, long: @to_indonesium.long, unit: @to_indonesium.unit, user_id: @to_indonesium.user_id } }
    end

    assert_redirected_to to_indonesium_url(ToIndonesium.last)
  end

  test "should show to_indonesium" do
    get to_indonesium_url(@to_indonesium)
    assert_response :success
  end

  test "should get edit" do
    get edit_to_indonesium_url(@to_indonesium)
    assert_response :success
  end

  test "should update to_indonesium" do
    patch to_indonesium_url(@to_indonesium), params: { to_indonesium: { destination: @to_indonesium.destination, long: @to_indonesium.long, unit: @to_indonesium.unit, user_id: @to_indonesium.user_id } }
    assert_redirected_to to_indonesium_url(@to_indonesium)
  end

  test "should destroy to_indonesium" do
    assert_difference('ToIndonesium.count', -1) do
      delete to_indonesium_url(@to_indonesium)
    end

    assert_redirected_to to_indonesia_url
  end
end
