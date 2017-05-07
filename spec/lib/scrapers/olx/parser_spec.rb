require 'rails_helper'

describe Scrapers::Olx::Parser do
  context 'scrape', vcr: {cassette_name: 'Olx/scrape-link'} do
    let(:link) { 'https://www.olx.pt/anuncio/ap-t2-no-elevador-da-bica-todo-equipado-IDAiP3Z.html#f754759dbc' }
    let(:parser) { Scrapers::Olx::Parser.new(link) }

    it { expect(parser.title).to eq 'Ap. t2 no elevador da bica, todo equipado' }
    it { expect(parser.offer_id).to eq '536434291' }
    it { expect(parser.price).to eq 1200 }
    it do
      byebug
      expect(parser.publicated_at).to eq '2017-04-27 10:31:00.000000000 +0200'
    end
  end
end
