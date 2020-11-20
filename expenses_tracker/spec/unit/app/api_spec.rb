require_relative '../../../app/api'
require 'rack/test'

module ExpenseTracker
  RSpec.describe API do
    include Rack::Test::Methods

    def app
      API.new(ledger: ledger)
    end

    let(:ledger) { instance_double('ExpenseTracker::Ledger') }
    let(:parsed_json) { JSON.parse(last_response.body) }

    describe 'POST /expenses' do
      let(:expense) { { 'some' => 'data' }}

      before do
        allow(ledger).to receive(:record)
          .with(expense)
          .and_return(RecordResult.new(true, 417, nil))
      end

      context 'when the expense is successfully recorded' do
        it 'returns the expense id' do
          post '/expenses', JSON.generate(expense)

          expect(parsed_json).to include('expense_id' => 417)
        end

        it 'responds with a 200 (OK)' do
          post '/expenses', JSON.generate(expense)
          expect(last_response.status).to eq(200)
        end
      end

      context 'when the expense fails validation' do
        let(:expense) { { 'some' => 'data' } }

        before do
          allow(ledger).to receive(:record)
            .with(expense)
            .and_return(RecordResult.new(false, 417, 'Expense incomplete'))
        end

        it 'returns an error message' do
          post '/expenses', JSON.generate(expense)

          expect(parsed_json).to include('error' => 'Expense incomplete')
        end

        it 'responds with a 422 (Unprocessable entity)' do
          post '/expenses', JSON.generate(expense)
          expect(last_response.status).to eq(422)
        end
      end
    end

    describe 'GET /expenses/:date' do
      let(:result) { { 'some' => 'data' } }
      let(:date) { '2020-11-20' }

      before do
        allow(ledger).to receive(:expenses_on)
          .with(date)
          .and_return(JSON.generate(result))
      end

      context 'when expenses exist on the given date' do
        it 'returns the expense records as JSON' do
          get "/expenses/#{date}"
          expect(parsed_json).to eq(JSON.generate(result))
        end

        it 'responds with a 200 (OK)' do
          get "/expenses/#{date}"
          expect(last_response.status).to eq(200)
        end
      end

      context 'when there are no expenses on the given date' do
        it 'returns an empty array as JSON'
        it 'responds with a 200 (OK)'
      end
    end
  end
end
