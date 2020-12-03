class API < Sinatra::Base
  def initialize(ledger: Ledger.new)
    @ledger = ledger
    super()
  end
end

app = API.new(ledger: Ledger.new)