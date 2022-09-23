# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to t('.repo'), "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener'
  end

  def flash_message_css_class(key)
    case key.to_sym
    when :notice then 'alert alert-info'
    when :success then 'alert alert-success'
    when :error then 'alert alert-error'
    when :alert then 'alert alert-danger'
    end
  end

  def project_link
    link_to 'Test Guru', root_path
  end
end
