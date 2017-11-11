# == Schema Information
#
# Table name: to_indonesia
#
#  id          :integer          not null, primary key
#  destination :string
#  long        :integer
#  unit        :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ToIndonesia < ApplicationRecord
	belongs_to :user
	
	validates_presence_of :destination, :long, :unit, :user_id
	
	validates :long, numericality: true

	# validates :unit, inclusion: %w(hari bulan tahun)

	enum unit: [ :hari, :bulan, :tahun  ]
	
end
