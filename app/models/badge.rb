# frozen_string_literal: true

class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence: true
  validates :rule, presence: true
  validates :rule_criterion, presence: true
  validates :url_picture, presence: true
end
