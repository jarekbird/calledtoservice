class NeedsAssessmentsController < ApplicationController
  before_action :set_needs_assessment, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /needs_assessments
  def index
    @needs_assessments = NeedsAssessment.all
  end

  # GET /needs_assessments/1
  def show
  end

  # GET /needs_assessments/new
  def new
    @needs_assessment = NeedsAssessment.new
    @needs_assessment.requester = Member.new
    @needs_assessment.receiver = Member.new
    @members = Member.all
  end

  # GET /needs_assessments/1/edit
  def edit
  end

  # POST /needs_assessments
  def create
    @needs_assessment = NeedsAssessment.new(needs_assessment_params)

    if @needs_assessment.save
      redirect_to @needs_assessment, notice: 'Needs assessment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /needs_assessments/1
  def update
    if @needs_assessment.update(needs_assessment_params)
      redirect_to @needs_assessment, notice: 'Needs assessment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /needs_assessments/1
  def destroy
    @needs_assessment.destroy
    redirect_to needs_assessments_url, notice: 'Needs assessment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_needs_assessment
      @needs_assessment = NeedsAssessment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def needs_assessment_params
      params.require(:needs_assessment).permit(:user_id, :relationship, :is_known, :needs, :time_frame)
    end
end
