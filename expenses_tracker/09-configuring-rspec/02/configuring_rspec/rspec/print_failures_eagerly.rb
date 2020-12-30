RSpec.configure do |config|
  config.before(:suite) do
    config.add_formatter RSpec::PrintFailuresEagerly::Formatter
  end
end

module SilenceDumpFailures
  def dump_failures(_notification)
  end
  RSpec::Core::Formatters::BaseTextFormatter.prepend(self)
end
