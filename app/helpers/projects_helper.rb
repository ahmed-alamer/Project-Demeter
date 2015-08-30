module ProjectsHelper
	def get_button_link(button_title, target_view)
		link_to button_title, projects_path(:status => target_view), :class => "btn btn-default #{@view_items == target_view ? 'active' : ''}"
	end
end