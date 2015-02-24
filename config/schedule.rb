env :PATH, ENV['PATH']

set :output, 'log/crontab.log'

set :environment, :production

every :hour do
  runner "Session.sweep"
end


