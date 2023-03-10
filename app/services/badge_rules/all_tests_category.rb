module BadgeRules
  class AllTestsCategory
    # if all tests of a certain category are passed
    def self.successfully?(rule_criterion, user_tests_ids, _test_passage)
      tests_category = Test.sort_by_category_title(rule_criterion).ids
      tests_category & user_tests_ids == tests_category
    end
  end
end
