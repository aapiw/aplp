# == Schema Information
#
# Table name: bipa_courses
#
#  id         :integer          not null, primary key
#  location   :string
#  long       :integer
#  unit       :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BipaCourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
