expect(account).to have_a_balance_of(a_value < 11_000_000)
# or
expect(account).to have_a_balance_of(a_value_within(50).of(10_500_000))