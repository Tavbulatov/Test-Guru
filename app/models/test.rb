# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  belongs_to :category
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :level, numericality: { only_integer: true }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }

  scope :sort_by_category_title, lambda { |category_name|
                                   joins(:category)
                                     .where(categories: { title: category_name })
                                 }

  def self.tests_by_category_title(category_name)
    sort_by_category_title(category_name).order(title: :desc).pluck(:title)
  end
end
