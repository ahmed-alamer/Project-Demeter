class ApproveProjectsController < ApplicationController

  def index
		@projects = Project.where.not(:status => "A1")  
  end

  def create
  	"Data format expected: 
  	[
  		{
  			'projectId' : NUMBER,
  			'projectStatus': STATUS
  		}
  	]"
		
		params[:approved_projects].each do |project|
			project_entity = Project.find(project[:project_id])
			project_entity.approval_status = ApprovalStatus.find(project[:project_status])
			project_entity.save
		end
		
    render json: {"answer": "success"}
  end

end
