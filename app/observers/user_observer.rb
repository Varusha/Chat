class UserObserver < ActiveRecord::Observer
  def after_create user
    WelcomeMailer.email(user).deliver_later
  end
end
