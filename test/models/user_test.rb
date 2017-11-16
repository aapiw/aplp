# == Schema Information
#
# Table name: users
#
#  id                          :integer          not null, primary key
#  email                       :string           default(""), not null
#  encrypted_password          :string           default(""), not null
#  reset_password_token        :string
#  reset_password_sent_at      :datetime
#  remember_created_at         :datetime
#  sign_in_count               :integer          default(0), not null
#  current_sign_in_at          :datetime
#  last_sign_in_at             :datetime
#  current_sign_in_ip          :inet
#  last_sign_in_ip             :inet
#  confirmation_token          :string
#  confirmed_at                :datetime
#  confirmation_sent_at        :datetime
#  unconfirmed_email           :string
#  name                        :string
#  country_id                  :integer
#  admin_id                    :integer
#  gender                      :integer
#  id_reg                      :string
#  passport                    :string
#  passport_expire             :date
#  dob                         :date
#  campus                      :string
#  majors                      :string
#  phone                       :string
#  profession                  :string
#  win                         :boolean
#  lock                        :boolean
#  complete                    :boolean
#  contest                     :integer
#  note                        :text
#  skype_id                    :integer
#  avatar_file_name            :string
#  avatar_content_type         :string
#  avatar_file_size            :integer
#  avatar_updated_at           :datetime
#  passport_image_file_name    :string
#  passport_image_content_type :string
#  passport_image_file_size    :integer
#  passport_image_updated_at   :datetime
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
