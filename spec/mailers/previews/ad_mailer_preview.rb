# Preview all emails at http://localhost:3000/rails/mailers/ad_mailer
class AdMailerPreview < ActionMailer::Preview
  def new_ads
    AdMailer.new_ads(Ad.limit(3))
  end
end
