class AppController < ApplicationController

  def show
    redirect_to Url.find_by_short_url(params[:id]).long_url
  end

end
