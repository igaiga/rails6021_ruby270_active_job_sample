# ActiveJobではなく、Sidekiqを直接つかうクラス
# irb> AsyncLogWorker.perform_async(message: "from sidekiq")
class AsyncLogWorker
  include Sidekiq::Worker

  def perform(message, count = 1)
    AsyncLog.create!(message: message) # String
#    AsyncLog.create!(message: message.name) # AR
  end
end
