RSpec.configure do |config|
  config.disable_monkey_patching!
  config.order = :random
end

# Old syntax

describe SwissArmyKnife do # bare `describe` method
  it 'is useful' do
    knife.should be_useful # `should` expectation
  end
end

# New syntax

RSpec.describe SwissArmyKnife do # `describe` called on the `RSpec` module
  it 'is useful' do
    expect(knife).to be_useful # `expect()`-style expectation
  end
end