class AdMailer < ApplicationMailer
  def new_ads(ads)
    @user = User.first
    @ads  = ads
    mail(to: 'pbrudny@gmail.com', subject: 'New apartments for you!')
  end
end
