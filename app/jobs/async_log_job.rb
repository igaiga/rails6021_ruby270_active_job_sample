class AsyncLogJob < ApplicationJob
  queue_as :default
  # queue_as do
  #   case self.arguments.first[:message]
  #   when "to async_log"
  #     :async_log
  #   else
  #     :default
  #   end
  # end

  # sidekiq_options retry: 0 # Sidekiqの設定をAJに書ける
  # https://github.com/mperham/sidekiq/wiki/Active-Job#customizing-error-handling

  # retry_on RuntimeError, wait: 3.seconds, attempts: 3
  # discard_on RuntimeError do |job, error|
  #   SomeNotifier.push(error)
  # end
  # rescue_from RuntimeError do |error|
  #   pp "***rescue!!!***"
  #   pp error
  # end

  def perform(message: "hello") # 引数を定義できる
#    sleep 5
#    raise "in job" # RuntimeError
    AsyncLog.create!(message: message) # この行を追加する
  end
end
