class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.welcome_email(User.first, Order.includes(line_items: :product).first)
  end
end

# this allows the email to be previewed at
# http://localhost:3000/rails/mailers/user_mailer/welcome_email.
# LIST of previews: http://localhost:3000/rails/mailers.