# frozen_string_literal: true

class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    { description: "Test title: #{@question.test.title}",
      files:
        { 'question.txt':
          { content: gist_content } } }
  end

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN', nil))
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
