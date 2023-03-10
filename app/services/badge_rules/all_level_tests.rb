# frozen_string_literal: true

module BadgeRules
  class AllLevelTests
    def self.successfully?(rule_criterion, user_tests_ids, _test_passage)
      tests = Test.where('level = ?', rule_criterion).ids
      tests & user_tests_ids == tests
    end
  end
end
