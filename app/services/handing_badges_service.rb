class HandingBadgesService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.find_each do |b|
      send("rule#{b.rule}", b.rule_criterion, @test) ? @user.badges.push(Badge.where('rule = ?', b.rule)) : nil if @test_passage.passed
    end
  end

  private
  def rule1(*rule_criterion)
    #if all tests of a certain category are passed
    tests_category = Test.sort_by_category_title(rule_criterion[0]).ids
    tests_category & user_tests_ids == tests_category
  end

  def rule2(*rule_criterion)
    #if the test is passed the first time
    @user.tests.where('title = ?', rule_criterion[1].title).count == 1
  end

  def rule3(*rule_criterion)
    #if all tests of a certain level are passed
    tests = Test.where('level = ?', rule_criterion[0]).ids
    tests & user_tests_ids == tests
  end

  def user_tests_ids
    @user.tests.ids.uniq.sort
  end
end
