# Complex flow instead of using helper methods

RSpec.describe BerlinTransitTicket do
  let(:ticket) { BerlinTransitTicket.new } # 3 referred

  before do # 1. before hook runs
    ticket.starting_station = starting_station # 2. refers
    ticket.ending_station = ending_station # 5. refers
  end

  let(:fare) { ticket.fare } # 8.

  context 'when starting in zone A' do
    let(:starting_station) { 'Bunderstag' } # 4.

    context 'and ending in zone B' do
      let(:ending_station) { 'Leopoldplatz' } # 6.

      it 'costs $2.70' do
        expect(fare).to eq 2.7 # 7.
      end
    end

    context 'and ending in zone C' do
      let(:ending_station) { 'Birkenwerder' }

      it 'costs $3.30' do
        expect(fare).to eq 3.3
      end
    end
  end
end