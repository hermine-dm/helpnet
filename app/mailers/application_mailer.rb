# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply-shine@yopmail.com'
  layout 'mailer'
end
