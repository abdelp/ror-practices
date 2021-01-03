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
