# bundle exec foreman s
web: LOG_LEVEL=warn bundle exec puma -C config/puma.rb
worker: env QUEUE=normal bundle exec rake environment resque:work
low_worker: env QUEUE=low bundle exec rake environment resque:work
high_worker: env QUEUE=high bundle exec rake environment resque:work
top_worker: env QUEUE=top bundle exec rake environment resque:work
scheduler: DYNAMIC_SCHEDULE=true bundle exec rake environment resque:scheduler
frontend: bin/webpack-dev-server
