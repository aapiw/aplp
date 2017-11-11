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

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

	attr_accessor :submit_profile
	attr_accessor :decided

	has_many :to_indonesians, dependent: :destroy
	has_many :bipa_courses, dependent: :destroy

	accepts_nested_attributes_for :to_indonesians, :bipa_courses, allow_destroy: true, reject_if: :all_blank
	
	has_one :confirmation, dependent: :destroy
	has_one :score, dependent: :destroy

	belongs_to :admin
	belongs_to :country

	enum gender: [ :lk, :pr]

	validates_presence_of :name, :country_id, :gender, :passport, :passport_expire, :dob,
												:campus, :majors, :phone, :profession, :lock, :note, :avatar, :passport, if: :submit_profile

	validates_presence_of	:win, if: :decided

	validates :passport, uniqueness: true
	validates :id_reg, uniqueness: true
	
	after_create :create_id_reg

	protected
	
	def create_id_reg
		update_attributes(id_reg: "APLP-#{Time.now.strftime("%Y-%d-%m")}-#{id.to_s.rjust(4, '0')}")
	end


end
