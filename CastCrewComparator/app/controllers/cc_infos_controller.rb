class CcInfosController < ApplicationController
  before_action :set_cc_info, only: %i[ show edit update destroy ]

  # GET /cc_infos or /cc_infos.json
  def index
    @cc_infos = CcInfo.all
  end

  # GET /cc_infos/1 or /cc_infos/1.json
  def show
  end

  # GET /cc_infos/new
  def new
    @cc_info = CcInfo.new
  end

  # GET /cc_infos/1/edit
  def edit
  end

  # POST /cc_infos or /cc_infos.json
  def create
    @cc_info = CcInfo.new(cc_info_params)

    respond_to do |format|
      if @cc_info.save
        format.html { redirect_to cc_info_url(@cc_info), notice: "Cc info was successfully created." }
        format.json { render :show, status: :created, location: @cc_info }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cc_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cc_infos/1 or /cc_infos/1.json
  def update
    respond_to do |format|
      if @cc_info.update(cc_info_params)
        format.html { redirect_to cc_info_url(@cc_info), notice: "Cc info was successfully updated." }
        format.json { render :show, status: :ok, location: @cc_info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cc_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cc_infos/1 or /cc_infos/1.json
  def destroy
    @cc_info.destroy

    respond_to do |format|
      format.html { redirect_to cc_infos_url, notice: "Cc info was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cc_info
      @cc_info = CcInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cc_info_params
      params.require(:cc_info).permit(:name, :picture, :knownFor)
    end
end
