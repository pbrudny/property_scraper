require 'rails_helper'

describe Scrapers::OlxScraper do
  context 'Scrape from Olx' do
    it 'creates ads' do
      expect { Scrapers::OlxScraper.new.call }.to change { Ad.count }
    end
  end
end
