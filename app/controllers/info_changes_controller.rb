class InfoChangesController < ApplicationController
  before_action :set_info_change, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /info_changes
  def index
    @info_changes = InfoChange.all
  end

  # GET /info_changes/1
  def show
  end

  # GET /info_changes/new
  def new
    @info_change = InfoChange.new
    @info_change.requester = Member.new
    @info_change.receiver = Member.new
    @members = Member.all
  end

  # GET /info_changes/1/edit
  def edit
  end

  # POST /info_changes
  def create
    @info_change = InfoChange.new(info_change_params)

    if @info_change.save
      redirect_to @info_change, notice: 'Info change was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /info_changes/1
  def update
    if @info_change.update(info_change_params)
      redirect_to @info_change, notice: 'Info change was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /info_changes/1
  def destroy
    @info_change.destroy
    redirect_to info_changes_url, notice: 'Info change was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info_change
      @info_change = InfoChange.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def info_change_params
      params.require(:info_change).permit(:user_id, :comments)
    end
end
