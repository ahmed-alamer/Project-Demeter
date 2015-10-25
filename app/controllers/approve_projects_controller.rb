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
      project_entity = Project.find(project[:project_id])
      project_entity.approval_status = ApprovalStatus.find(project[:project_status])
      project_entity.save
    end

    render json: {'answer': 'success'}
  end

  def show
    # approved_projects = Project.where(["status = 'A1' and updated_at >= ?", Date.today])
    approved_projects = Project.where(:status => 'A1')
                            .where('updated_at >= ?', Date.today)
    @adjustment_grants = Array.new

    approved_projects.each do |project|
      grant = Grant.new
      grant.amount = calculate_grant_amount project #this should be calculated as the excel sheet, later!
      grant.project = project
      grant.wallet = project.claimant.wallets.first #considering the first wallet to be the default
      grant.type_tag = 'AGRT'
      grant.grant_date = adjust_date(project.install_date)
      @adjustment_grants << grant
    end

    respond_to do |format|
      format.html
      format.csv do
        file_name = "\"#{Date.today}-grants\""
        headers['Content-Disposition'] = "attachment; filename=#{file_name}"
        # headers['Content-Type'] = 'text/csv'
      end
    end

  end

  def submit_adjustment_grants
    #todo: read the values of the request body and create grants and save them
  end

  private
  def adjust_date(install_month)
    calc_month = nil
    six_months = Date.new

    if install_month.month <= 6
      calc_month = install_month
    else
      calc_month = install_month.advance(:months => 6)
    end

    if Date.today.month >= calc_month.month && Date.today.month <= calc_month.advance(:months => 6).month
      six_months = Date.new(six_months.year, calc_month.month, six_months.day)
    else
      six_months = calc_month.advance(:months => 6)
    end

    if Date.today.month > 6
      calc_month = Date.new(Date.today.year, calc_month.month, 1)
    elsif calc_month.month == six_months.month
      calc_month = Date.new(Date.today.year, calc_month.month, 1)
    else
      calc_month = Date.new(Date.today.year -1, calc_month.month, 1)
    end

    calc_month
  end

  def calculate_grant_amount(project)
    (181 * 24 * project.nameplate * 0.15) / 1000
  end

end
