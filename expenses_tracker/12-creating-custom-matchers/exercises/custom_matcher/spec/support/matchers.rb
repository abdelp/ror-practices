class HaveTicketsSold
  def initialize(tickets_sold)
    @tickets_sold = tickets_sold
  end

  def matches?(event)
    @event = event

    values_match?(@tickets_sold, )
  end

  def description
    "have #{@tickets_sold} tickets sold"
  end

  def failure_message
    "expected #{@}"
  end

  private

    def failure_reason
      ", but had #{tickets_sold} tickets sold"
    end

    def tickets_sold
      @event.tickets_sold
    end
end

module EventMatchers
  def have_tickets_sold
    HaveTicketsSold.new()
  end
end

RSpec.configure do |configure|
  config.include EventMatchers
end