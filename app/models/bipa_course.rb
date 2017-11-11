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

class BipaCourse < ApplicationRecord
  belongs_to :user
  enum unit: [ :hari, :bulan, :tahun  ]
  
  validates_presence_of :location, :long, :unit
  
end
