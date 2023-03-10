module BadgeRules
  class RuleFirstAttemptTestPass
    def self.successfully?(rule_criterion, test_passage)
      test_passage.user.tests.where('title = ?', test_passage.test.title).count == rule_criterion
    end
  end
end
