class UrlsController < ApplicationController

	before_action :load_url, only: [:show, :edit, :update, :destroy]

	def index
		@urls = Urls.all
	end

	def new
		@url = Url.new
	end

  def create
	  url_params = params.require(:url).permit(:link)
	  url_params["random_string"] = SecureRandom.hex(3)
	  @url = Url.create url_params
	 
	  redirect_to url_path(@url)
  end

  private
    def url_params
      params.require(:url).permit(:link)  
    end

  	def load_url
    	@url = Url.find(params[:id])
  	end
end
