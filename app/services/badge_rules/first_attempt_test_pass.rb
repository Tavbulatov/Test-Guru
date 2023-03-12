module BadgeRules
  class FirstAttemptTestPass
    def self.successfully?(rule_criterion, _user_tests_ids, test_passage)
      test_passage.user.test_passages.where(passed: true).where('test_id = ?',
                                                                test_passage.test.id).count == rule_criterion.to_i
    end
  end
end
