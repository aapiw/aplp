# == Schema Information
#
# Table name: schedules
#
#  id                        :integer          not null, primary key
#  year                      :string
#  start_registration        :date
#  end_registration          :date
#  start_central_selection   :date
#  end_central_selection     :date
#  start_consulate_selection :date
#  end_consulate_selection   :date
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class Schedule < ApplicationRecord
	validates_presence_of :year, :start_registration, :end_registration, :start_central_selection, :end_central_selection, :start_consulate_selection,
												:end_consulate_selection
	class << self
		def can_register?
			Time.now >= self.last.start_registration and Time.now <= self.last.end_registration
		end
		
		def can_sign_in?
			Time.now >= self.last.start_registration
		end
	end
end
