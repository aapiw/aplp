require 'test_helper'

class ConfirmationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @confirmation = confirmations(:one)
  end

  test "should get index" do
    get confirmations_url
    assert_response :success
  end

  test "should get new" do
    get new_confirmation_url
    assert_response :success
  end

  test "should create confirmation" do
    assert_difference('Confirmation.count') do
      post confirmations_url, params: { confirmation: { arrival_ticket: @confirmation.arrival_ticket, date_of_return_flight: @confirmation.date_of_return_flight, dress_size: @confirmation.dress_size, flight_arrival_date: @confirmation.flight_arrival_date, flight_arrival_hours: @confirmation.flight_arrival_hours, flight_arrival_number: @confirmation.flight_arrival_number, flight_return_number: @confirmation.flight_return_number, hijab: @confirmation.hijab, return_flight_hours: @confirmation.return_flight_hours, return_ticket: @confirmation.return_ticket, script: @confirmation.script, user_id: @confirmation.user_id } }
    end

    assert_redirected_to confirmation_url(Confirmation.last)
  end

  test "should show confirmation" do
    get confirmation_url(@confirmation)
    assert_response :success
  end

  test "should get edit" do
    get edit_confirmation_url(@confirmation)
    assert_response :success
  end

  test "should update confirmation" do
    patch confirmation_url(@confirmation), params: { confirmation: { arrival_ticket: @confirmation.arrival_ticket, date_of_return_flight: @confirmation.date_of_return_flight, dress_size: @confirmation.dress_size, flight_arrival_date: @confirmation.flight_arrival_date, flight_arrival_hours: @confirmation.flight_arrival_hours, flight_arrival_number: @confirmation.flight_arrival_number, flight_return_number: @confirmation.flight_return_number, hijab: @confirmation.hijab, return_flight_hours: @confirmation.return_flight_hours, return_ticket: @confirmation.return_ticket, script: @confirmation.script, user_id: @confirmation.user_id } }
    assert_redirected_to confirmation_url(@confirmation)
  end

  test "should destroy confirmation" do
    assert_difference('Confirmation.count', -1) do
      delete confirmation_url(@confirmation)
    end

    assert_redirected_to confirmations_url
  end
end
