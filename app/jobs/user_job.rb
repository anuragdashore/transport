class UserJob < ApplicationJob
  queue_as :default

  def perform(id)
    # Do something later
    UserMailer.welcome_email(id).deliver_later
  end
end
