class HomeController < ApplicationController
  layout 'application'
  def index

    #Making a test call
    @client = current_user.contactually_api
    @me = @client.get("/v2/me").parsed['data']    

    render 'index'
  end
end
