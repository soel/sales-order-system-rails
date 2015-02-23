set :job_template, "/bin/bash -i -c ':job'"

set :output, 'log/crontab.log'

set :environment, :production

every :hour do
  runner "Sesson.sweep"
end

