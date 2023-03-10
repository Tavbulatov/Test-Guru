class BadgeOptionsDeliveryService

  RULE_CLASSES_TITLE = { attemp: BadgeRules::RuleFirstAttemptTestPass,
                         level: BadgeRules::RuleAllLevelTests,
                         category: BadgeRules::RuleAllTestsCategory }.freeze

   def initialize(test_passage)
     @test_passage = test_passage
     @user = test_passage
   end


  def call
    Badge.find_each do |badge|
        @user.badges < badge if RULE_CLASSES_TITLE[badge.rule].successfully?(badge.rule_criterion, @user_tests_ids, @test_passage)
    end
  end

  def user_tests_select
    @user_tests_ids = @test_passage.user.test_passages.find_all(&:passed).map(&:test).map(&:id).sort.uniq
  end
end
