class GistsController < ApplicationController
  def create
    test_passage = TestPassage.find(params[:test_passage_id])

    result = GistQuestionService.new(test_passage.current_question).call

    flash = if result.succes?
              Gist.create!(user: current_user, question: test_passage.current_question, url: result.html_url)
              { notice: t('.succes',
                          html_url: view_context.link_to('Gist', result.html_url, target: '_blank', rel: 'noopener')) }
            else
              { notice: t('.failure') }

            end

    redirect_to test_passage, flash
  end
end
