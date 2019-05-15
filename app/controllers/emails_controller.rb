class EmailsController < ApplicationController

  def new
    @email = Email.new
    @email.urls.build
    @url = Url.new
  end

  def create
    @email = Email.new email_params
    if @email.save
      short_url = "#{request.protocol}#{request.host_with_port}/app/" + @email.urls.collect{|e| e.short_url}.first
      render json: {short_url: short_url}
    else
      render json: {error: @email.errors.full_messages}, status: :unprocessable_entity      
    end
  end

  def original_link
    short_link = params[:url][:short_url].split('/').last
    @url       = Url.find_by(short_url: short_link)
    if @url
      @email = @url.email.address
      render json: {email: @email, original_link: @url.long_url}
    else
      render json: {error: "Could not find short link"}, status: :unprocessable_entity
    end
  end

  private
  def email_params
    params.require(:email).permit(:address, urls_attributes: [:long_url, :short_url])
  end

end
