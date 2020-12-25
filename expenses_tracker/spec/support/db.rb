RSpec.configure do |c|
  c.before(:suite) do
    Sequel.extension :migration
    Sequel::Migrator.run(DB, 'db/migrations')
    DB[:expenses].truncate
    FileUtils.mkdir_p('log')
    require 'logger'
    DB.loggers << Logger.new('log/sequel.log')
  end

  c.around(:example, :db) do |example|
    log = Logger.new('log/sequel.log')
    log.info("Starting example: #{example.description}")
    DB.transaction(rollback: :always) { example.run }
    log.info("Ending example: #{example.description} ")
  end
end