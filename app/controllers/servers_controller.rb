class ServersController < ApplicationController
  before_action :set_server, only: [:show, :edit, :update, :destroy]
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /servers
  def index
    @servers = Server.all
  end

  # GET /servers/1
  def show
  end

  # GET /servers/new
  def new
    @server = Server.new
    @server.member = Member.new
  end

  # GET /servers/1/edit
  def edit
  end

  # POST /servers
  def create
    @server = Server.new(server_params)
    @server.member = @member if @member
    if @server.save
      redirect_to @server, notice: 'Server was successfully created.'
    else
      existing_server = Server.find_by(@server.member.id)
      if existing_server.update(service: server_params[:service])
        redirect_to @server, notice: 'Server was successfully created.'
      else
        render :new, notice: 'Server failed to create.'
      end
    end
  end

  # PATCH/PUT /servers/1
  def update
    if @server.update(server_params)
      redirect_to @server, notice: 'Server was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /servers/1
  def destroy
    @server.destroy
    redirect_to servers_url, notice: 'Server was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @server = Server.find(params[:id])
    end

    def set_member
      @member = Member.find(server_params[:member_attributes][:id]) unless server_params[:member_attributes][:id].blank?
    end

    # Only allow a trusted parameter "white list" through.
    def server_params
      params.require(:server).permit(:service, member_attributes: [:id, :first_name, :last_name, :email, :phone_number, :address])
    end
end
