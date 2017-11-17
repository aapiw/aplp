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

class Confirmation < ApplicationRecord
  belongs_to :user
  enum dress_size: [ :xs, :s, :m, :l, :xl, :xxl ]

  validates_presence_of :flight_arrival_number, :flight_arrival_date, :flight_arrival_hours, :flight_return_number,
												:date_of_return_flight, :return_flight_hours, :hijab, :dress_size, :script_file_name, :script, :return_ticket

	has_attached_file :script 
	has_attached_file :arrival_ticket
	has_attached_file :return_ticket
	

  validates_attachment_content_type :script, content_type: ['image/jpeg', 'image/jpg', 'image/png'], message: 'Format Naskah salah'
  validates_attachment_content_type :arrival_ticket, content_type: ['image/jpeg', 'image/jpg', 'image/png'], message: 'Format tiket kedatangan salah'
  validates_attachment_content_type :return_ticket, content_type: ['image/jpeg', 'image/jpg', 'image/png'], message: 'Format tiket keberangkatan salah'

  validates_attachment :script, size: { in: 0..1.megabytes, message: 'Naskah harus kurang dari 1 megabytes' }
  validates_attachment :arrival_ticket, size: { in: 0..1.megabytes, message: 'Tiket kedatangan harus kurang dari 1 megabytes' }
  validates_attachment :return_ticket, size: { in: 0..1.megabytes, message: 'Tiket kepulangan harus kurang dari 1 megabytes' }

  validates_attachment_file_name :script, matches: [/jpe?g\Z/, /png\Z/, /JP?G\Z/, /PNG\Z/ ]
  validates_attachment_file_name :arrival_ticket, matches: [/jpe?g\Z/, /png\Z/, /JP?G\Z/, /PNG\Z/ ]
  validates_attachment_file_name :return_ticket, matches: [/jpe?g\Z/, /png\Z/, /JP?G\Z/, /PNG\Z/ ]

  after_save :update_user_status

	protected

	def update_user_status
		self.user.update_attributes(lock:true)
		# update_attributes(id_reg: "APLP-#{Time.now.strftime("%Y-%d-%m")}-#{id.to_s.rjust(4, '0')}")
	end
end
