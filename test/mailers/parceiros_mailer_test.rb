require 'test_helper'

class ParceirosMailerTest < ActionMailer::TestCase
  test "pedir_parceria" do
    mail = ParceirosMailer.pedir_parceria
    assert_equal "Pedir parceria", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
