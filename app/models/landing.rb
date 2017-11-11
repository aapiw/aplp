# == Schema Information
#
# Table name: landings
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Landing < ApplicationRecord
	validates_presence_of :title
end
