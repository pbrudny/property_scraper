class AdMailer < ApplicationMailer
  def new_ads(ads)
    binding.pry
    @user = User.first
    @ads  = ads
    mail(to: 'pbrudny@gmail.com', subject: 'New apartments for you!')
  end
end
