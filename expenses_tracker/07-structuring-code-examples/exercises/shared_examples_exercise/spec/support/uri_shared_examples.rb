RSpec.shared_examples 'URI' do |uri|
  it 'parses the host' do
    expect(uri.parse('http://foo.com/').host).to eq 'foo.com'
  end

  it 'parses the port' do
    expect(uri.parse('http://example.com:9876').port).to eq 9876
  end
end
