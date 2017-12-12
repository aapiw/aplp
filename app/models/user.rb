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

class User < ApplicationRecord
	include UploadValidations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

	attr_accessor :save_profile
	# attr_accessor :decided

	# has_attached :avaatar

	has_many :to_indonesias, dependent: :destroy
	has_many :bipa_courses, dependent: :destroy
	
	has_one :confirmation, dependent: :destroy
	has_one :score, dependent: :destroy

	belongs_to :admin
	belongs_to :country

	accepts_nested_attributes_for :to_indonesias, :bipa_courses, allow_destroy: true, reject_if: :all_blank
	
	enum gender: [ :lk, :pr]


	validates_presence_of :name, :country_id, :gender, :passport, :passport_expire, :dob,
												:campus, :majors, :phone, :profession, :avatar, :passport, if: :save_profile

	validates :passport, uniqueness: true
	validates :id_reg, uniqueness: true
	# validates_presence_of	:lock
	# validate :locked_form, on: :update, if: :save_profile
	 
	scope :completes, -> { where(complete: true) }
	
	# FOR FILTERS
	scope :search_complete, -> (complete) { where(complete: complete) }
	scope :search_year, -> (year) { where('extract(year  from users.created_at) = ?', year) }
	scope :search_kind, -> (kind) { joins(:score).where(scores:{kind: kind}) }
	scope :search_consulate, -> (consulate_id) { User.where(admin_id: consulate_id) }
	scope :search_win, -> (win) { where(win: win) }
	scope :search_country, -> (country_id) { User.where(country_id: country_id) }

	after_create :build_additional
	before_save :encrypt_password, if: :password

  def encrypt_password
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
    encrypted_data = crypt.encrypt_and_sign(self.password)
    self.display_password = encrypted_data
  end
  
  def decrypt_password
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
    crypt.decrypt_and_verify(display_password) if display_password
  end

	def admin?
	  false
	end
	
  def locked_form
    if User.find(id).lock
      errors.add(:lock, "Akun Anda di Kunci")
    end
  end

	def status
		if win == true
			"<span class='label bg-green'>Menang</span>".html_safe
		elsif win == false
			"<span class='label bg-pink'>kalah</span>".html_safe
		else
			"<span class='label bg-pink'>Masa Pendaftaran</span>".html_safe
		end
	end

	def status_akun
		if confirmed? == true
			"<span class='label bg-green'>Aktif</span>".html_safe
		else
			"<span class='label bg-pink'>Belum Aktif</span>".html_safe
		end
	end

	def gender_print
		gender == "lk" ? "Laki-Laki" : "Perempuan"
	end
	
	def counting_age
	  now = Time.now
	  if self.dob.present?
	    dob = self.dob
	    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
	  else
	    ""
	  end
	end

	def year
		created_at.year.to_s
	end

	def consulate
		admin
	end
	
	class << self
		
	end

	protected

	def build_additional
		update_attributes(id_reg: "APLP#{Time.now.strftime("%Y-%d-%m")}#{id.to_s.rjust(4, '0')}")
		score = self.build_score
		score.save(validate:false)
	end

end
