class Water
  def self.elements
    [:oxygen, :hydrogen]
  end
end

RSpec.describe Water do
  it 'is H20' do
    expect(Water.elements).to contain_exactly(:hydrogen, :hydrogen, :oxygen)
  end
end