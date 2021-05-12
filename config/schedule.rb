# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
job_type :runner, "cd :path && script/rails runner -e :environment ':task' :output"

# !!!IMPORTANT: SCHEDULE FOR PRODUCTION
if !File.expand_path(File.dirname(__FILE__)).include?("showmojo/dev")
  # IMPORTANT: app/admin/accounts#update uses this time for cancelling unpaid invoice,
  # so it should be updated accordingly
  every :day, at: '4:50 am', roles: [:rake] do
    runner "Delayed::Job.enqueue(BillingJob.new(Date.today))"
  end
else
  # IMPORTANT: app/admin/accounts#update uses this time for cancelling unpaid invoice,
  # so it should be updated accordingly
  every :day, at: '4:50 am', roles: [:rake] do
    runner "Delayed::Job.enqueue(BillingJob.new(Date.today))"
  end
end