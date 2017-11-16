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
# END

Schedule.find_or_create_by(year:"2018", start_registration:Time.now.next_year,
													end_registration:Time.now.next_year.next_month, 
													start_consulate_selection:Time.now.next_year.next_month.next_week,
													end_consulate_selection:Time.now.next_year.next_month.next_week.next_month,
													start_central_selection:Time.now.next_year.next_month.next_week.next_month,
													end_central_selection:Time.now.next_year.next_month.next_month.next_month )

if Rails.env.staging? or Rails.env.development?
	puts 'start development seed'
	
	puts 'end development seed'
end