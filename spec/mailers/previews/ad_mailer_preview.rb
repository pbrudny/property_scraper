# Preview all emails at http://localhost:3000/rails/mailers/ad_mailer
class AdMailerPreview < ActionMailer::Preview
  def new_ads
    AdMailer.new_ads([[SearchLink.first.name, Ad.all[0..3]], [SearchLink.second.name, Ad.all[4..6]], [SearchLink.second.name, []]])
  end
end
