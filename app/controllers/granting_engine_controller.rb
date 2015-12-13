require 'csv'

class GrantingEngineController < ApplicationController

  def approve_projects
    @projects = Project.where(:status => 'P')
  end

  # Expected Data format:
  # [
  # 	{
  # 		'projectId' : NUMBER,
  # 		'projectStatus': STATUS
  # 	}
  # ]
  def execute_approve_projects
    params[:approved_projects].each do |project|
      project_id = project[:project_id]
      approval_status = project[:project_status]

      project_entity = Project.find(project_id)
      project_entity.approval_status = ApprovalStatus.find(approval_status)
      project_entity.save
    end

    render json: {'answer': 'success'}
  end

  def adjustment_grants
    approved_projects = Project.where(:adjusted => false)

    @adjustment_grants = generate_adjustment_grants(approved_projects)

    respond_to do |format|
      format.html
      format.csv do
        @adjustment_grants.each { |grant| grant.save }
        file_name = "\"#{Date.today}-grants\""
        headers['Content-Type'] = 'text/csv'
        headers['Content-Disposition'] = "attachment; filename=#{file_name}"
      end
    end
  end

  def periodic_grants
    @grants = generate_periodic_grants(Project.all).compact

    respond_to do |format|
      format.html
      format.csv do
        @grants.each { |grant| grant.save }
        file_name = "\"#{Date.today}-periodic-grants\""
        headers['Content-Type'] = 'text/csv'
        headers['Content-Disposition'] = "attachment; filename=#{file_name}"
      end
    end
  end

  private
  def generate_adjustment_grants(approved_projects)
    approved_projects.map do |project|
      Grant.new(:GUID => generate_guid('AGRT', project),
                :project => project,
                :receiver_wallet => project.wallet_address,
                :type_tag => 'AGRT',
                :grant_date => adjust_date(project.install_date),
                :amount => calculate_adjustment_amount(project, Date.today))
    end
  end

  def generate_periodic_grants(projects)
    projects.map do |project|
      grant_date = Date.today
      six_months = project.install_date.advance(:months => 6)
      six_months = Date.new(grant_date.year, six_months.month, six_months.day)

      unless six_months > grant_date
        Grant.new(:GUID => generate_guid('PGRT', project),
                  :project => project,
                  :receiver_wallet => project.wallet_address,
                  :amount => 180 * project.nameplate * 0.15, # 6 months = 180 days
                  :grant_date => grant_date,
                  :type_tag => 'PGRT')
      end
    end
  end

  def generate_guid(type_tag, project)
    [
        type_tag,
        project.country,
        project.post_code,
        project.id,
        project.nameplate,
        project.claimant_id,
        project.install_date.to_formatted_s(:iso8601),
        DateTime.now.strftime('%Y-%m-%d')
    ].join('-')
  end

  def adjust_date(install_date)
    install_date = Date.new(2010, 1, 1) if install_date.year < 2010
    next_anniversary = Date.new(Date.today.year, install_date.month, install_date.day)
    six_months = next_anniversary.advance(:months => 6)

    if Date.today > six_months
      Date.new(six_months.year, six_months.month, 1)
    else
      Date.new(six_months.year - 1, six_months.month, 1)
      # Why is isn't there a retreat method!?
    end
  end

  def calculate_adjustment_amount(project, grant_date)
    project_install_date = project.install_date

    if project_install_date.year < 2010
      project_install_date = Date.new(2010, 1, 1)
    end

    day_diff = grant_date - project_install_date
    (24 * (project.nameplate) * day_diff * 0.15) / 1000
  end

end
