class AsyncLogJob < ApplicationJob
  queue_as :default

  def perform(message: "hello") # 引数を定義できる
    # sleep 5
    AsyncLog.create!(message: message) # この行を追加する
  end
end
