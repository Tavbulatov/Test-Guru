# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[result update show gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    gist = Gist.new(user: current_user, question: @test_passage.current_question, url: result.url)

    flash = if gist.save
      {notice: t('.succes', url: gist.url)}
    else
      {notice: t('.failure')}
    end

    redirect_to @test_passage, flash
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
