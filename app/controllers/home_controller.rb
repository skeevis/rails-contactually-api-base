class HomeController < ApplicationController
  layout 'application'
  def index

    #Making a test call
    @client = current_user.contactually_api
    @me = @client.get("/v2/me").parsed['data']    

    SampleWorker.perform_async()


    render 'index'
  end
end
