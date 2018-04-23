require 'rails_helper'

describe Scrapers::Olx::Parser do
  context 'scrape', vcr: {cassette_name: 'Olx/scrape-link'} do
    let(:link) { 'https://www.olx.pt/anuncio/bonito-apartamento-remodelado-em-s-vicente-IDBnFVs.html#87c7955816' }
    let(:agent) { Mechanize.new { |agent| agent.user_agent_alias = 'Windows Chrome' } }
    let(:parser) { Scrapers::Olx::Parser.new(link, agent) }

    it { expect(parser.title).to eq 'Bonito apartamento remodelado em S.Vicente' }
    it { expect(parser.offer_id).to eq '552367204' }
    it { expect(parser.price).to eq 1200 }
    it { expect(parser.main_image).to eq 'https://img01-olxpt.akamaized.net/img-olxpt/939444677_1_644x461_bonito-apartamento-remodelado-em-svicente-lisboa.jpg' }
    it { expect(parser.publicated_at).to eq 'Fri, 06 Apr 2018 20:20:00.000000000 +0000' }
  end
end
