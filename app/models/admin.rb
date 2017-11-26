# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  username               :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  contact                :text
#  email                  :text
#  name                   :string
#  role                   :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable, :recoverable,
         :rememberable, :trackable, :validatable, authentication_keys: [:username]
  
  # validates :email, format: false
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates_presence_of :name, :role

  has_many :users
  has_and_belongs_to_many :countries

  enum role: [ :admin, :consulate ]

  scope :consulates, -> { where(role: "consulate") }

	class << self
	  def total_countries_admins
		  Admin.find_by_sql("SELECT count(*) as total FROM admins_countries").last.total
		end
	end
	
  def admin?
    true
  end

  protected
  

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

end
