module ApplicationHelper
	#full title helper
	def full_title(page_title = '')
		base_title = "College Market"
		if page_title.empty?
			base_title
		else 
			page_title + " | " + base_title
		end
	end 
def page_header(text)
    content_for(:page_header) { text.to_s }
  end
  
  def active_page(active_page)
    @active == active_page ? "active" : ""
  end 
end
