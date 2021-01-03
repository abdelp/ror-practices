expect(Math.sqrt(9)).to eq(3)

# equivalent to:
Math.sqrt(9) == 3

perms      = Permutations.new
first_try  = perms.of(long_word_list)
second_try = perms.of(long_word_list)

expect(second_try).to eq(first_try)

expect(second_try).to equal(first_try)

RSpec.describe RSpec do
  describe '.configuration' do
    it 'returns the same object every time' do
      expect(RSpec.configuration).to equal(RSpec.configuration)
      expect(RSpec.configuration).to be(RSpec.configuration)
    end
  end
end

# 3 == 3.0:
expect(3).to eq(3.0)

# ...but 3.eql?(3.0) is false:
expect(3).not_to eql(3.0)

expect([String, Regexp]).to include(String)
# same as
expect(['a string', Regexp]).to include(String)

# to fix

expect([String, Regexp]).to include(an_object_eq_to String)

expect(true).to be_truthy
expect(0).to be_truthy

expect(1.odd?).to be true
expect(2.odd?).to eq false

expect(1).to be == 1
expect(1).to be < 2
expect(1).to be <= 2
expect(2).to be > 1
expect(2).to be >= 1
expect(String).to be === 'a string'
expect(/foo/).to be =~ 'food'


squares = 1.upto(4).map { |i| i * i }
expect(squares).to include(a_value > 15)

# This will fail:

expect(0.1 + 0.2).to eq(0.3)

# expected: 0.3
#      got: 0.30000000000004

expect(0.1 + 0.2).to be_within(0.0001).of(0.3)

town_population = 1237
expect(town_population).to be_within(25).percent_of(1000)

# Ranges

expect(town_population).to be_between(750, 1250)
expect(town_population).to be_between(750, 1250).inclusive
expect(town_population).to be_between(750, 1250).exclusive

# Dynamic Predicates

expect([]).to be_empty

# both work

expect(user).to be_admin
expect(user).to be_an_admin

hash = { name: 'Harry Potter', age: 17, house: 'Gryffindor' }
expect(hash).to have_key(:age)

# Trade-off

expect(user.admin?).to eq(true)

expect(array_of_hashes).to include(have_key(:lol))

# Satisfaction

expect(1).to satisfy { |number| number.odd? }

expect([1, 2, 3]).to include(an_object_satisfying(&:even?))