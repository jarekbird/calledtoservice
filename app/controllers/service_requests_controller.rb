class ServiceRequestsController < ApplicationController
  before_action :set_service_request, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /service_requests
  def index
    @service_requests = ServiceRequest.all
  end

  # GET /service_requests/1
  def show
  end

  # GET /service_requests/new
  def new
    @service_request = ServiceRequest.new
    @service_request.requester = Member.new
    @service_request.receiver = Member.new
  end

  # GET /service_requests/1/edit
  def edit
  end

  # POST /service_requests
  def create
    @service_request = ServiceRequest.new(service_request_params)
    @service_request.requester = @requester if @requester
    @service_request.receiver = @receiver if @receiver
    if @service_request.save
      redirect_to @service_request, notice: 'Service request was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /service_requests/1
  def update
    if @service_request.update(service_request_params)
      redirect_to @service_request, notice: 'Service request was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /service_requests/1
  def destroy
    @service_request.destroy
    redirect_to service_requests_url, notice: 'Service request was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_request
      @service_request = ServiceRequest.find(params[:id])
    end

    def set_requester
      @requester = Member.find(service_request_params[:requester_attributes][:id]) unless service_request_params[:requester_attributes][:id].blank?
    end

    def set_receiver
      @receiver = Member.find(service_request_params[:receiver_attributes][:id]) unless service_request_params[:receiver_attributes][:id].blank?
    end

    # Only allow a trusted parameter "white list" through.
    def service_request_params
      params.require(:service_request).permit(:user_id, :service_needed, :comments, :date1, :date2,
      requester_attributes: [:id, :first_name, :last_name, :phone_number, :address, :email],
      receiver_attributes: [:id, :first_name, :last_name, :phone_number, :address, :email])
    end
end
