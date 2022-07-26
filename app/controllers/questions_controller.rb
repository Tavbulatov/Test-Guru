# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy update edit]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index; end

  def new
    @question = @test.questions.new
    @question_test = @test.id
  end

  def create
    @question = @test.questions.new(question_params)
    @question_test = @test.id
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def show
    @question_test = Test.find(@question.test_id)
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    @question_test = Test.find(@question.test_id)
    redirect_to test_path(@question_test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question is not found'
  end
end
