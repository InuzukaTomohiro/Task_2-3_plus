require "test_helper"

class EventMailerTest < ActionMailer::TestCase
  test "sent_notification" do
    mail = EventMailer.sent_notification
    assert_equal "Sent notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
