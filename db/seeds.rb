	puts 'start production data behaviour'

	# NEGARA
	puts 'start create countries seed'
	negaraxls = Roo::Excelx.new( Rails.root.join('NEGARA.xlsx') )

	negaraxls.each_row_streaming(offset: 1) do |row|
	  country = Country.find_or_create_by( name: row[1].value, country_code: row[2].value.class == Float ? row[2].value.to_i : row[2].value, iso_code: row[3].value )
	  puts country
	  puts Country.count
	end
	puts 'end create countries seed'
	# NEGARA END

	# CONSULATE

	# puts 'start create admin consulate seed'
	#Validate by username
	kbrixls = Roo::Excelx.new( Rails.root.join('KBRI.xlsx') )

	kbrixls.each_row_streaming(offset: 1) do |row|
		admin = Admin.new
		admin.username = row[5].value
		admin.contact = row[3].value
		admin.password = row[6].value
	  admin.password_confirmation = row[6].value
	  admin.name = row[1].value
	  admin.email = row[4].value
	  admin.role = "consulate"
		if admin.save
			"admin saved"
		else
			"admin unsaved"
		end
		puts "Admin Consulate:"
		puts Admin.where(role:"consulate").count
	end
	# CONSULATE END

	# Just can running for the first
	#create consulate habtm countries
	# if Admin.where(role:"consulate").count < 1
	kbrixls.each_row_streaming(offset: 1) do |row|
		admin = Admin.find_by_username(row[5].value)
		if admin
				country = Country.find_by_name(row[2].value)
			  if country
					admin.countries << country
					puts "admin.countries.count"
					puts admin.countries.count
				else
					puts "country not found"
			  end
		else
			puts "Username is blank"
		end
	end

	Schedule.find_or_create_by(year:"2018", start_registration:Time.now.next_year,
														end_registration:Time.now.next_year.next_month, 
														start_consulate_selection:Time.now.next_year.next_month.next_week,
														end_consulate_selection:Time.now.next_year.next_month.next_week.next_month,
														start_central_selection:Time.now.next_year.next_month.next_week.next_month,
														end_central_selection:Time.now.next_year.next_month.next_month.next_month )

	if Admin.where(role:"admin").count < 1
		adm = Admin.new
		adm.username = ENV["APLP_ADMIN"]
		adm.password = ENV["APLP_PASSWORD"]
		adm.password_confirmation = ENV["APLP_PASSWORD"]
		adm.name = "Admin Pusat"
		adm.role = "admin"
		adm.save
	end

	if Landing.count < 1
		Landing.find_or_create_by(title:"Selamat datang di aplikasi APLP 2018 <br> Atdikud BPKLN Kemendikbud RI")
	end

puts 'end start production data behaviour'

unless Rails.env.production?
	puts 'start development data behaviour'
	if User.count < 30
		30.times do |i|
			i=i+1
			u = User.create( email:"user#{i}@mail.com", password:"user#{i}@mail.com", password_confirmation:"user#{i}@mail.com", name:"user#{i}",
									passport:"0890#{i}092", passport_expire:Time.now.next_month, gender:["lk",'pr'].sample, country_id:[1,2,3].sample,
									admin_id:Country.find([1,2,3].sample).admins.sample.id, complete:[true,false].sample, confirmed_at:Time.now )
			u.score.update_attribute(:kind, "pidato") 	if (1..8).include? i
			u.score.update_attribute(:kind, "bercerita") if (8..16).include? i
		end
	end
	puts 'end start development data behaviour'
end