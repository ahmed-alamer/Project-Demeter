class ApprovalStatusesController < ApplicationController
  before_action :set_approval_status, only: [:show, :edit, :update, :destroy]

  # GET /approval_statuses
  # GET /approval_statuses.json
  def index
    @approval_statuses = ApprovalStatus.all
  end

  # GET /approval_statuses/1
  # GET /approval_statuses/1.json
  def show
  end

  # GET /approval_statuses/new
  def new
    @approval_status = ApprovalStatus.new
  end

  # GET /approval_statuses/1/edit
  def edit
  end

  # POST /approval_statuses
  # POST /approval_statuses.json
  def create
    @approval_status = ApprovalStatus.new(approval_status_params)

    respond_to do |format|
      if @approval_status.save
        format.html { redirect_to @approval_status, notice: 'Approval status was successfully created.' }
        format.json { render :show, status: :created, location: @approval_status }
      else
        format.html { render :new }
        format.json { render json: @approval_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /approval_statuses/1
  # PATCH/PUT /approval_statuses/1.json
  def update
    respond_to do |format|
      if @approval_status.update(approval_status_params)
        format.html { redirect_to @approval_status, notice: 'Approval status was successfully updated.' }
        format.json { render :show, status: :ok, location: @approval_status }
      else
        format.html { render :edit }
        format.json { render json: @approval_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /approval_statuses/1
  # DELETE /approval_statuses/1.json
  def destroy
    @approval_status.destroy
    respond_to do |format|
      format.html { redirect_to approval_statuses_url, notice: 'Approval status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approval_status
      @approval_status = ApprovalStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def approval_status_params
      params.require(:approval_status).permit(:code, :details)
    end
end
