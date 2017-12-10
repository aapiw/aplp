module ApplicationHelper
	# def root_path
	# 	if user_signed_in?
	# 		users_dashboard_index_path
	# 	else
	# 		admins_dashboard_index_path
	# 	end
	# end
	
	def active_class(link_path, link_path2=nil)
		if link_path.present? and link_path2.present?
			if current_page?(link_path)
				"active"		
			elsif current_page?(link_path2)
				"active"
			end
		else
		 current_page?(link_path) ? "active" : "" 
		end
	end

	def show(exp=nil)
		if exp == "Belum"
			"<span class='label bg-orange'>Belum Lengkap</span>".html_safe 
		elsif exp.nil? or exp.blank?
			"<span class='label bg-orange'>Kosong</span>".html_safe
		else
			case exp
			when String
				exp.titlecase rescue nil
			else
				exp
			end
		end
	end
end
