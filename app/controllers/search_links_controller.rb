class SearchLinksController < ApplicationController

  def create
    @site = Site.find(params[:site_id])
    @site.search_links.create(search_link_params)
    redirect_to site_path(@site)
  end

  def destroy
    @site = Site.find(params[:site_id])
    SearchLink.find(params[:id]).destroy
    redirect_to site_path(@site)
  end

  private

  def search_link_params
    params.require(:search_link).permit(:name, :url, :site_id)
  end
end
