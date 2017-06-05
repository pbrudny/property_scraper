class LoadsController < ApplicationController
  before_action :set_load, only: [:show]

  # GET /loads
  def index
    @loads = Load.all
  end

  # GET /loads/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_load
      @load = Load.find(params[:id])
    end
end
