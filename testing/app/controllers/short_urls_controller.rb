class ShortUrlsController < ApplicationController
  URL_CHARACTERS = (("A".."Z").to_a + ("0".."9").to_a)
  URL_LENGTH = 5

  SHORT_KEY = "SL"
  
  respond_to :html, :xml, :json

  def create
    begin
   	  @short_url = ShortUrl.create(url_params)
   	  $url = ShortUrl.find(@short_url.id)
    rescue Exception => e
      $url = nil
      Rails.logger.error { "Encountered an error when trying to find or create Person for #{e.backtrace.join("\n")}" }
      nil
    end

    logger.debug "hsjksadfhkjsdfw: #{$url}"
    respond_with $url, location: '/index/create'
  end

  def redirect
      @shortened_url = ShortUrl.find_by_short_url(params[:short_url])
      redirect_to @shortened_url.original_url
  end

  private

  def url_params
  	short_link = generate_short_link
  	params[:short_url][:short_url] = short_link
  	params.require(:short_url).permit(:original_url, :short_url)
  end

  def generate_short_link
	link = nil
	until !link.nil? && !ShortUrl.exists?(short_key(link))
		link = URL_LENGTH.times.inject(""){|link|
			link + URL_CHARACTERS[rand(URL_CHARACTERS.length)]
		}
	end
	link
  end

  def short_key(short_link)
	"#{SHORT_KEY}_#{short_link}"
  end
end
