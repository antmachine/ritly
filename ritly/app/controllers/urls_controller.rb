class UrlsController < ApplicationController

	def index
		@urls = Url.all
	end

	def new
		@url = Url.new
	end

  def create
  	#grabbing the params from the submission form
	  url_params = params.require(:url).permit(:link)

	  if params["url"]["random_string"] == nil
	  	#app generated random string for when user doesn't provide one
	  	url_params[:random_string] = secure_hash
	  else
	  	#use the random_string provided by the user
	  	url_params[:random_string] = params["url"]["random_string"]
	  end
	  #save the params to the database
	  @url = Url.create url_params
	  redirect_to url_path(@url)
  end

  def update
  	@url.update url_params
  	redirect_to url_path(@url)
  end

  def destroy
  	@url.destroy
  	redirect_to new_url_path
  end

  private
    def url_params
      params.require(:url).permit(:link)  
    end

  	def secure_hash
  		secure_hash = SecureRandom.urlsafe_base64(4)
  	end
end
