require 'sinatra/base'
require 'json'
require_relative 'ledger'
require 'ox'

module ExpenseTracker
  class API < Sinatra::Base
    def initialize(ledger: Ledger.new)
      @ledger = ledger
      super()
    end

    post '/expenses' do
      expense = JSON.parse(request.body.read)
      result = @ledger.record(expense)

      if result.success?
        JSON.generate('expense_id' => result.expense_id)
      else
        status 422
        JSON.generate('error' => result.error_message)
      end
    end

    get '/expenses/:date' do
      if request.media_type === 'text/xml'
        doc = Ox::Document.new

        instruct = Ox::Instruct.new(:xml)
        instruct[:version] = '1.0'
        instruct[:encoding] = 'UTF-8'
        instruct[:standalone] = 'yes'
        doc << instruct

        other_elements = Ox::Raw.new(@ledger.expenses_on(params[:date]))
        doc << other_elements

        Ox.dump(doc)
      else
        JSON.generate(@ledger.expenses_on(params[:date]))
      end
    end
  end
end
