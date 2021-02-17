expect('a string').to include('str')
expect([1, 2, 3]).to include(3)

hash = { name: 'Harry Potter', age: 17, house: 'Gryffindor' }
expect(hash).to include(:name)
expect(hash).to include(age: 17)

expect('a string').to include('str', 'ing')
expect([1, 2, 3]).to include(3, 2)
expect(hash).to include(:name, :age)
expect(hash).to include(name: 'Harry Potter', age: 17)

# Gotcha

# This matcher expects the array to include [3, 2]
# rather than to include(3, 2)
expecteds = [3, 2]
expect([1, 2, 3]).to include(expecteds)

# To make it pass:

expect([1, 2, 3]).to include(*expecteds)

expect('a string').to start_with('a str').and end_with('ng')
expect([1, 2, 3]).to start_with(1).and end_with(3)

expect([1, 2, 3]).to start_with(1, 2)
expect([1, 2, 3]).to end_with(2, 3)

expect([‘list’, ‘of’, ‘words’]).to start_with(
	a_string_ending_with(‘st’)
).and end_with(
	a_string_starting_with(‘wo’)
)

# all

numbers = [2, 4, 6, 8]
expect(numbers).to all be_even

def self.evens_up_to(n = 0)
  0.upto(n).select(&:odd?)
end

expect(evens_up_to).to all be_even

RSpec::Matchers.define_negated_matcher :be_non_empty, :be_empty

expect(evens_up_to).to be_non_empty.and all be_even

# match

children = [
  { name: 'Coen', age: 6 },
  { name: 'Daphne', age: 4 },
  { name: 'Crosby', age: 2 }
]

expect(children).to match [
  { name: 'Coen', age: a_value > 5 },
  { name: 'Daphne', age: a_value_between(3, 5) },
  { name: 'Crosby', age: a_value < 3 }
]

expect('a string').to match(/str/)
expect('a string').to match('str')

# contain_exactly

expect(children).to contain_exactly(
  { name: 'Daphne', age: a_value_between(3, 5) },
  { name: 'Crosby', age: a_value < 3 },
  { name: 'Coen', age: a_value > 5 }
)

expect(children).to contain_exactly(
  { name: 'Crosby', age: a_value < 3 },
  { name: 'Coen', age: a_value > 5 },
  { name: 'Daphne', age: a_value_between(3, 5) }
)

# have_attributes

require 'uri'
uri = URI('http://github.com/rspec/rspec')
expect(uri).to have_attributes(host: 'github.com', path: '/rspec/rspec')

expect([uri]).to include(an_object_having_attributes(host: 'github.com'))