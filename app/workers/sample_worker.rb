class SampleWorker
  include Sidekiq::Worker
  def perform()
   #do stuff here
  end
end
