class AsyncLogJob < ApplicationJob
  queue_as do
    case self.arguments.first[:message]
    when "to async_log"
      :async_log
    else
      :default
    end
  end

  def perform(message: "hello") # 引数を定義できる
    # sleep 5
    AsyncLog.create!(message: message) # この行を追加する
  end
end
