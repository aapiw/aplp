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
	
	validates_presence_of :destination, :long, :unit
	
	validates :long, numericality: true

	# validates :unit, inclusion: %w(hari bulan tahun)

	enum unit: [ :hari, :bulan, :tahun  ]
	# validate :locked_form
  
 #  def locked_form
 #    if self.user.lock
 #      errors.add(:lock, "Akun Anda di Kunci")
 #    end
 #  end
end
