class SearchLinksController < ApplicationController
  before_action :set_search_link, only: [:show, :edit, :update, :destroy]

  def index
    @search_links = SearchLink.all
  end

  def show
  end

  def new
    @search_link = SearchLink.new
  end

  def edit
  end

  def create
    @search_link = SearchLink.new(search_link_params)

    respond_to do |format|
      if @search_link.save
        format.html { redirect_to @search_link, notice: 'Search link was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @search_link.update(search_link_params)
        format.html { redirect_to @search_link, notice: 'Search link was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @search_link.destroy
    respond_to do |format|
      format.html { redirect_to search_links_url, notice: 'Search link was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_link
      @search_link = SearchLink.find(params[:id])
    end

    def set_site
      @site = Site.find(params[:site_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_link_params
      params.require(:search_link).permit(:name, :url, :site_id)
    end
end
