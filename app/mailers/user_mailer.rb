class UserMailer < ActionMailer::Base
  default from: 'hellokittyframgia@gmail.com', subject: "Kitty answer your question"

  def answer_email qa
    @qa = qa
    mail(to: @qa.email)
  end
end
