require 'test_helper'

class AsyncLogJobTest < ActiveJob::TestCase
  test "Enqueue AsyncLogJob" do
    assert_enqueued_with(job: AsyncLogJob) do
      AsyncLogJob.perform_later
    end
  end

  test "Check DB insertion" do
    AsyncLogJob.perform_now(message: "test text")
    assert_equal "test text", AsyncLog.last.message
  end

  test "test imidiately perform_enqueued_jobs method with block" do
    perform_enqueued_jobs do
      AsyncLogJob.set(wait: 1.minute).perform_later(message: "test text")
    end
    assert_equal "test text", AsyncLog.last.message
  end

  test "test imidiately perform_enqueued_jobs method" do
    AsyncLogJob.set(wait: 1.minute).perform_later(message: "test text")
    perform_enqueued_jobs
    assert_equal "test text", AsyncLog.last.message
  end
end
