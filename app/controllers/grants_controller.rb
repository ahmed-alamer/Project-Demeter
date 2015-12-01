class GrantsController < ApplicationController
  before_action :set_grant, only: [:edit, :update, :destroy]
  before_action :get_project, only: [:create, :update]
  before_action :set_receiver_wallet, only: [:create, :update]
  after_action :set_guid, only: [:create, :update]

  # GET /grants
  # GET /grants.json
  def index
    # So whoever reads this code, please, if you know a better way to do this pull it!
    @view_items = if params[:view] then
                    params[:view]
                  else
                    "AGRT"
                  end

    if @view_items == "BGRT"
      @grants = Bounty.all
    else
      @grants = Grant.where(:type_tag => @view_items)
    end
  end

  # GET /grants/1
  # GET /grants/1.json
  def show
    @grant = Grant.find(params[:id])
  end

  # GET /grants/new
  def new
    @grant = Grant.new
  end

  # GET /grants/1/edit
  def edit
  end

  # POST /grants
  # POST /grants.json
  def create
    @grant = Grant.new(grant_params)
    respond_to do |format|
      if @grant.save
        format.html {
          redirect_to @grant, notice: 'Grant was successfully created.'
        }
        format.json { render :show, status: :created, location: @grant }
      else
        format.html { render :new }
        format.json {
          render json: @grant.errors, status: :unprocessable_entity
        }
      end
    end
  end

  # PATCH/PUT /grants/1
  # PATCH/PUT /grants/1.json
  def update
    respond_to do |format|
      if @grant.update(grant_params)
        format.html {
          redirect_to @grant, notice: 'Grant was successfully updated.'
        }
        format.json { render :show, status: :ok, location: @grant }
      else
        format.html { render :edit }
        format.json {
          render json: @grant.errors, status: :unprocessable_entity
        }
      end
    end
  end

  # DELETE /grants/1
  # DELETE /grants/1.json
  def destroy
    @grant.destroy
    respond_to do |format|
      format.html {
        redirect_to grants_url, notice: 'Grant was successfully destroyed.'
      }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_grant
    @grant = Grant.find(params[:id])
    @grant.project_id = @grant.project.name
  end

  def get_project
    project = Project.where(:name => grant_params[:project_id]).take
    params[:grant][:project_id] = project.id
  end

  def set_receiver_wallet
    grant = params[:grant]
    wallet = grant_params[:receiver_wallet]
    grant[:receiver_wallet] = Wallet.where(:tag => wallet).first.id
  end

  def set_guid
    if @grant.type_tag == "AGRT"
      install_date = Project.find(@grant.project.id).install_date
      @grant.grant_date = adjust_date(install_date)
    end

    @grant.GUID = "#{@grant.type_tag}-#{@grant.project.country}-#{@grant.project.post_code}-#{@grant.project.id}-#{@grant.project.nameplate}-#{@grant.project.claimant_id}-#{@grant.project.install_date.to_formatted_s(:iso8601)}-#{@grant.created_at.strftime('%Y-%m-%d')}"
    @grant.save
  end

  def set_grant_date
    if @grant.type_tag == "AGRT"
      @grant.grant_date = get_adjustment_date(@grant.project.install_date)
    else
      @grant.grant_date = Date.today
    end
  end

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

  # Never trust parameters from the scary internet, only allow the white list through.
  def grant_params
    params.require(:grant).permit(:amount, :type_tag, :project_id, :receiver_wallet)
  end
end