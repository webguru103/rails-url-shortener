class UrlsController < ApplicationController
  def new
  end

  def create
    @client = Bitly.client
    @url = shortenURL(params[:url])
  end

  private

  def shortenURL(url)
    begin
      @client.shorten(params[:url])
    rescue Exception => e
      Rails.logger.error { "Encountered an error when trying to find or create Person for #{e.backtrace.join("\n")}" }
      nil
    end
  end
end
