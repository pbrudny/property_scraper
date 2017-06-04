class LoadsController < ApplicationController
  before_action :set_load, only: [:show, :edit, :update, :destroy]

  # GET /loads
  def index
    @loads = Load.all
  end

  # GET /loads/1
  def show
  end

  # GET /loads/new
  def new
    @load = Load.new
  end

  # GET /loads/1/edit
  def edit
  end

  # POST /loads
  def create
    @load = Load.new(load_params)

    if @load.save
      redirect_to @load, notice: 'Load was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /loads/1
  def update
    if @load.update(load_params)
      redirect_to @load, notice: 'Load was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /loads/1
  def destroy
    @load.destroy
    redirect_to loads_url, notice: 'Load was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_load
      @load = Load.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def load_params
      params.require(:load).permit(:errors)
    end
end
