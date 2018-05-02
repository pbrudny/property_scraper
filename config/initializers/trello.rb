require 'trello'

Trello.configure do |config|
  config.developer_public_key = ENV['trello_public_key']
  config.member_token = ENV['trello_token']
end

# require 'trello'
#
# Trello.configure do |config|
#   config.developer_public_key = 'b2f8b33e6427ad70f350fffffc9aaa62'
#   config.member_token = 'd764c8b65e5d68803299c19556fde103de76af7e0297a7d3075cf6e86cc0aa53'
# end
