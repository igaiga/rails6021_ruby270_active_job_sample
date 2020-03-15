# 起動

Sidekiqを使う設定になっているので、redisをセットアップして起動します。

- $ docker pull redis
- $ docker run -p 6379:6379 redis

Sidekiqを起動します。

- $ bundle exec sidekiq

# ジョブ実行

- AsyncLogJob.perform_later(message: "from another queue")
- AsyncLogJob.set(queue: :another_queue).perform_later(message: "from another queue")

確認

- AsyncLog.last

# Sidekiq

- dashboard
  - http://localhost:3000/sidekiq/
- 設定ファイル
  - config/sidekiq.yml
