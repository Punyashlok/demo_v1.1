class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.short_url = @url.generate_short_url
    @url.long_url = @url.sanitize
    if @url.save
      redirect_to urls_path
    else
      flash[:error] = @url.errors.full_messages
      redirect_to new_url_path 
    end  
  end

  def show
    @url = Url.find_by(short_url: params[:short_url])
    @url.increment!(:click)
    @url.ip_infos.create(ip_address: request.remote_ip)
    redirect_to @url.sanitize, allow_other_host: true
  end

  private
  def url_params
    params.require(:url).permit(:name,:long_url,:user_id, :category_id)
  end
end

# https://stackoverflow.com/questions/13497549/how-do-i-get-a-clients-ip-address-in-rails - Retrieving client's IP
