# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/tests_mailer
class TestsMailerPreview < ActionMailer::Preview
  def completed_test
    test_passage = TestPassage.first
    TestsMailer.completed_test(test_passage)
  end
end
