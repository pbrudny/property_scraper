require 'rails_helper'

describe Scrapers::Olx::Parser do
  context 'scrape', vcr: {cassette_name: 'Olx/scrape-link'} do
    let(:link) { 'https://www.olx.pt/anuncio/t2-lumiar-IDAcivR.html#e7f3421fb8;promoted' }
    let(:agent) { Mechanize.new { |agent| agent.user_agent_alias = 'Windows Chrome' } }
    let(:parser) { Scrapers::Olx::Parser.new(link, agent) }

    it { expect(parser.title).to eq 'T2 Lumiar' }
    it { expect(parser.offer_id).to eq '534879261' }
    it { expect(parser.price).to eq 700 }
    it { expect(parser.main_image).to eq 'https://img01-olxpt.akamaized.net/img-olxpt/906804807_1_644x461_t2-lumiar-lisboa.jpg' }
    it do
      expect(parser.publicated_at).to eq 'Mon, 05 Jun 2017 00:00:00.000000000 +0000'
    end
  end
end
