class GistsController < ApplicationController
  def create
    test_passage = TestPassage.find(params[:test_passage_id])

    result = GistQuestionService.new(@test_passage.current_question).call

    flash = if result.url.nil?
              { notice: t('.failure') }
            else
              Gist.create!(user: current_user, question: @test_passage.current_question, url: result.url)

              { notice: t('.succes', url: result.url) }
            end

    redirect_to test_passage, flash
  end
end
