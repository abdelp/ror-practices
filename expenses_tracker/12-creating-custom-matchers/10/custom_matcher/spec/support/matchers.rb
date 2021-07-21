class HaveABalanceOf
  include RSpec::Matchers::Composable

  def initialize(amount)
    @amount = amount
  end

  def as_of(date)
    @as_of_date = date
    self
  end

  def matches?(account)
    @account = account

    values_match?(@amount, account_balance)
  end

  def description
    if @as_of_date
      "have a balance of #{description_of(@amount)} as of #{@as_of_date}"
    else
      "have a balance of #{description_of(@amount)}"
    end
  end

  def failure_message
    "expected #{@account.inspect} to #{description}" + failure_reason
  end

  def failure_message_when_negated
    "expected #{@account.inspect} not to #{description}" + failure_reason
  end

  private

    def failure_reason
      ", but had a balance of #{account_balance}"
    end

    def account_balance
      if @as_of_date
        @account.balance_as_of(@as_of_date)
      else
        @account.current_balance
      end
    end
end

module AccountMatchers
  def have_a_balance_of(amount)
    HaveABalanceOf.new(amount)
  end
end

RSpec.configure do |configure|
  config.include AccountMatchers
end
