class UserMailer < ApplicationMailer
  default from: ENV["SMTP_USERNAME"]

  def welcome_email
    @user = params[:user]
    mail(
      to: @user.email,
      subject: "Bem-vindo ao Movie Catalog 🎬"
    )
  end
end
