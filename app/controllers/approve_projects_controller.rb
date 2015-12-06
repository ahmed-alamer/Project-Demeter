require 'csv'

class ApproveProjectsController < ApplicationController

  def index
    @projects = Project.where(:status => 'P')
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
      project_id = project[:project_id]
      approval_status = project[:project_status]

      project_entity = Project.find(project_id)
      project_entity.approval_status = ApprovalStatus.find(approval_status)
      project_entity.save
    end

    render json: {'answer': 'success'}
  end

  def show
    approved_projects = Project.where(:status => 'A1')
                            .where('updated_at >= ?', Date.today)
    @adjustment_grants = Array.new

    approved_projects.each do |project|
      grant = Grant.new
      grant.project = project
      # considering the first wallet to be the default
      grant.wallet = project.claimant.wallets.first
      grant.type_tag = 'AGRT'
      grant.grant_date = adjust_date(project.install_date)
      grant.amount = calculate_grant_amount(project, grant.grant_date)
      @adjustment_grants << grant
    end

    respond_to do |format|
      format.html
      format.csv do
        submit_adjustment_grants
        file_name = "\"#{Date.today}-grants\""
        headers['Content-Disposition'] = "attachment; filename=#{file_name}"
        # headers['Content-Type'] = 'text/csv'
      end
    end

  end


  private
  def submit_adjustment_grants
    #todo: read the values of the request body and create grants and save them
    @adjustment_grants.each { |grant| grant.save }
  end

  def adjust_date(install_date)
    if install_date.year < 2010
      install_date = Date.new(2010,1,1)
    end

    next_anniversary = Date.new(Date.today.year,
                                install_date.month,
                                install_date.day)
    six_months  = next_anniversary.advance(:months => 6)

    if Date.today > six_months
      Date.new(six_months.year, six_months.month, 1)
    else
      Date.new(six_months.year - 1, six_months.month, 1)
      # Why is isn't there a retreat method!?
    end
 end

  def calculate_grant_amount(project, grant_date)
    project_install_date = project.install_date

    if project_install_date.year < 2010
      project_install_date = Date.new(2010, 1, 1)
    end

    day_diff = grant_date - project_install_date
    (24 * (project.nameplate) * day_diff * 0.15) / 1000
  end

end
