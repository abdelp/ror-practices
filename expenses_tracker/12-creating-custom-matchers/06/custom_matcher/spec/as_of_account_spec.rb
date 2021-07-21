expect(account).to have_a_balance_of(30).and \
                   have_attributes(name: 'Checking')

expect(user_accounts).to include(an_account_with_a_balance_of(30))