class SearchLinksController < ApplicationController
  before_action :set_search_link, only: [:show, :edit, :update, :destroy]

  # GET /search_links
  # GET /search_links.json
  def index
    @search_links = SearchLink.all
  end

  # GET /search_links/1
  # GET /search_links/1.json
  def show
  end

  # GET /search_links/new
  def new
    @search_link = SearchLink.new
  end

  # GET /search_links/1/edit
  def edit
  end

  # POST /search_links
  # POST /search_links.json
  def create
    @search_link = SearchLink.new(search_link_params)

    respond_to do |format|
      if @search_link.save
        format.html { redirect_to @search_link, notice: 'Search link was successfully created.' }
        format.json { render :show, status: :created, location: @search_link }
      else
        format.html { render :new }
        format.json { render json: @search_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_links/1
  # PATCH/PUT /search_links/1.json
  def update
    respond_to do |format|
      if @search_link.update(search_link_params)
        format.html { redirect_to @search_link, notice: 'Search link was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_link }
      else
        format.html { render :edit }
        format.json { render json: @search_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_links/1
  # DELETE /search_links/1.json
  def destroy
    @search_link.destroy
    respond_to do |format|
      format.html { redirect_to search_links_url, notice: 'Search link was successfully destroyed.' }
      format.json { head :no_content }
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
