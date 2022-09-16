# frozen_string_literal: true

class GistQuestionService
  attr_reader :client

  def initialize(question, client = nil)
    @question = question
    @client = client || Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN', nil))
  end

  def call
    @client.create_gist(gist_params)
  end

  def gist_params
    { description: "Test title: #{@question.test.title}",
      files:
        { 'question.txt':
          { content: gist_content } } }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
