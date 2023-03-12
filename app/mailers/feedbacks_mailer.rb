# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  def feedback_created(feedback)
    @feedback = feedback

    Admin.all.pluck(:email).each do |admin|
      mail to: admin
    end
  end
end
