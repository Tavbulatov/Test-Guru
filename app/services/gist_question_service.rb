# frozen_string_literal: true

class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @client = client
  end

  Result = Struct.new(:html_url) do
    def succes?
      html_url.present?
    end
  end

  def call
    Result.new(@client.create_gist(gist_params).html_url)
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
