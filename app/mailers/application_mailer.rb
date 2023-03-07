# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <alihantavbulatov@yandex.ru>}
  layout 'mailer'
end
