class AdMailer < ApplicationMailer
  def new_ads(ads)
    @user = User.first
    @search_link_with_ads  = ads
    @ads_number = ads.flatten.count - ads.count
    mail(to: 'pbrudny@gmail.com', subject: 'New apartments for you!')
  end
end
