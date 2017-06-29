class AdsController < ApplicationController
  before_action :set_ad, only: %i(show edit update not_interesting interesting accepted rejected in_progress)

  def index
    search_params = { status_eq: 'new' } if params[:q].blank?
    @q = Ad.ransack(search_params)
    @ads = @q.result(distinct: true)
  end

  def show
    @appointment = Appointment.new
    @note = Note.new
  end

  def new
    @ad = Ad.new
  end

  def edit
  end

  def create
    @ad = Ad.new(ad_params)

    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def interesting
    @ad.mark_interesting!
    redirect_to ads_path, notice: 'Marked as interesting'
  end

  def accepted
    @ad.mark_accepted!
    redirect_to ads_path, notice: 'Marked as accepted'
  end

  def in_progress
    @ad.mark_in_progress!
    redirect_to ads_path, notice: 'Marked as in progress'
  end

  def not_interesting
    @ad.mark_not_interesting!
    redirect_to ads_url, notice: 'Marked as not interesting. Removed from the main list'
  end

  def rejected
    @ad.mark_rejected!
    redirect_to ads_url, notice: 'Marked as rejected. Removed from the main list'
  end

  def load
    Ads::LoadAds.new.call
    redirect_to ads_url, notice: 'Loaded latest ads'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:title, :url, :phone, :price, :status, :district_id, :type)
    end
end
