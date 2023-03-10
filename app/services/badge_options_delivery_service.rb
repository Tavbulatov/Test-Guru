class BadgeOptionsDeliveryService
  RULE_CLASSES_TITLE = { attemp: BadgeRules::FirstAttemptTestPass,
                         level: BadgeRules::AllLevelTests,
                         category: BadgeRules::AllTestsCategory }.freeze
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    user_tests_select
  end

  def call
    Badge.find_each do |badge|
      @user.badges.push(badge) if RULE_CLASSES_TITLE[badge.rule.to_sym].successfully?(badge.rule_criterion,
                                                                                      @user_tests_ids, @test_passage)
    end
  end

  def user_tests_select
    @user_tests_ids = @user.test_passages.find_all(&:passed).map(&:test).map(&:id).sort.uniq
  end
end
