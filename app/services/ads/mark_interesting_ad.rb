module Ads
  class MarkInterestingAd
    def initialize(ad)
      self.ad = ad
    end

    def call
      return if ad.interesting?
      ad.update(status: 'interesting')
      create_trello_card
    end

    private

    attr_accessor :ad

    def create_trello_card
      Trello::Card.create(
        name: ad.title,
        desc: description,
        list_id: todo_list_id
      )
    end

    def todo_list_id
      board.lists.first.id
    end

    def board
      Trello::Board.find(ENV['trello_board_id'])
    end

    def description
      "Original ad: #{ad.url} \n Image: #{ad.image_path}"
    end
  end
end
