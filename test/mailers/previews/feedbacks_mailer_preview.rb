# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/feedbacks_mailer
class FeedbacksMailerPreview < ActionMailer::Preview
  def feedback_created
    @feedback = Feedback.first
    FeedbacksMailer.feedback_created(@feedback)
  end
end
