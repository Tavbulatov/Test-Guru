# frozen_string_literal: true

class Feedback < ApplicationRecord
  validates :body, presence: true
end
