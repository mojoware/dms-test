class AppController < ApplicationController

  def show
    redirect_to Url.find_by_short_url(params[:id]).long_url
  end

  def original_link

  end

  def get_link
    @short_link = Url.new
  end

end
