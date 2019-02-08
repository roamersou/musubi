class ApplicationMailer < ActionMailer::Base
  default from: ENV['USER_NAME'],
  bcc: "roamers.yano@gmail.com"
  layout 'mailer'
end
