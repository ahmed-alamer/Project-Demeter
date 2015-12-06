module ProjectsHelper
	def get_button_link(button_title, target_view)
		projects_path = projects_path(:status => target_view)
		link_to button_title,
						projects_path,
						:class => "btn btn-default #{@view_items == target_view ? 'active' : ''}"
  end

  def display_nameplate(nameplate)
    number_to_human(nameplate, units: {unit: 'kW', thousand: 'mW', million: 'gW'})
  end
end