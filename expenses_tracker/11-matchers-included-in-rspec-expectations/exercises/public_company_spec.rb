PublicCompany = Struct.new(:name, :value_per_share, :share_count) do
  def got_better_than_expected_revenues
    self.value_per_share *= rand(1.05..1.10)
  end

  def market_cap
    @market_cap = self.value_per_share * share_count
  end
end

RSpec.describe PublicCompany do
  let(:company) { PublicCompany.new('Nile', 10, 100_000) }

  it 'increases its market cap when it gets better than expected revenues' do
    before_market_cap = company.market_cap
    company.got_better_than_expected_revenues
    after_market_cap = company.market_cap

    # expect(after_market_cap - before_market_cap).to satisfy("be greater than 50000") { |v| v > 50000 }
    expect { company.got_better_than_expected_revenues }.to change { company.market_cap }.by_at_least(50000)
  end

  it 'provides attributes' do
    obj = {
      # name: 'Nile',
      value_per_share: 10,
      share_count: 10_000,
      market_cap: 1_000_000
    }
  
    expect(company).to eq(obj)
  end
end