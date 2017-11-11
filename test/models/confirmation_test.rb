# == Schema Information
#
# Table name: confirmations
#
#  id                          :integer          not null, primary key
#  flight_arrival_number       :string
#  flight_arrival_date         :date
#  flight_arrival_hours        :string
#  flight_return_number        :string
#  date_of_return_flight       :date
#  return_flight_hours         :string
#  hijab                       :boolean
#  dress_size                  :integer
#  script_file_name            :string
#  script_content_type         :string
#  script_file_size            :integer
#  script_updated_at           :datetime
#  arrival_ticket_file_name    :string
#  arrival_ticket_content_type :string
#  arrival_ticket_file_size    :integer
#  arrival_ticket_updated_at   :datetime
#  return_ticket_file_name     :string
#  return_ticket_content_type  :string
#  return_ticket_file_size     :integer
#  return_ticket_updated_at    :datetime
#  user_id                     :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

require 'test_helper'

class ConfirmationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
