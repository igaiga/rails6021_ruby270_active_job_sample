require 'test_helper'

class AsyncLogJobTest < ActiveJob::TestCase
  test "Enqueue AsyncLogJob" do
    assert_enqueued_with(job: AsyncLogJob) do
      AsyncLogJob.perform_later
    end
  end
  test "Check DB insertion" do
    AsyncLogJob.perform_now(message: "abc")
    assert_equal "abc", AsyncLog.last.message
  end
end
