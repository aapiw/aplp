# Included in User
module UploadValidations
	extend ActiveSupport::Concern
	included do
		has_attached_file :avatar#,#, :s3_protocol => Rails.env.production?? :https : :http
		has_attached_file :passport_image#,#, :s3_protocol => Rails.env.production?? :https : :http
								# styles: { thumb: '100x100>',
								# medium: '300x300>',
								# original: '800x800>' }
	  validates_attachment_content_type :avatar, content_type: ['image/jpeg', 'image/jpg', 'image/png'], message: 'Format Foto salah'
	  validates_attachment_content_type :passport_image, content_type: ['image/jpeg', 'image/jpg', 'image/png'], message: 'Format passport salah'

	  validates_attachment :avatar, size: { in: 0..1.megabytes, message: 'Foto harus kurang dari 1 megabytes' }
	  validates_attachment :passport_image, size: { in: 0..1.megabytes, message: 'Passport harus kurang dari 1 megabytes' }

	  validates_attachment_file_name :avatar, matches: [/jpe?g\Z/, /png\Z/, /JP?G\Z/, /PNG\Z/ ]
	  validates_attachment_file_name :passport_image, matches: [/jpe?g\Z/, /png\Z/, /JP?G\Z/, /PNG\Z/ ]
  end

  # def is_pdf?
  # 	avatar.content_type.eql? 'application/pdf'
  # end

  # def is_image?
  # 	avatar.content_type.include? ['image/jpeg', 'image/jpg', 'image/png']
  # end

end
