# == Schema Information
#
# Table name: countries
#
#  id           :integer          not null, primary key
#  name         :string
#  country_code :string
#  iso_code     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Country < ApplicationRecord
	# has_many :users
	has_many :user_lives, class_name: "User", foreign_key: "country_live_id"
	has_many :users, class_name: "User", foreign_key: "country_id"

	has_and_belongs_to_many :admins

	validates_presence_of :name, :country_code, :iso_code



	class << self
		# def test
			
		# end
    end
end
