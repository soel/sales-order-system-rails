set :output, 'log/crontab.log'

every 1.hours do
  runner "Sesson.sweep"
end

