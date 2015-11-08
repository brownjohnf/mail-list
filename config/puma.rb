workers Integer(ENV['WEB_CONCURRENCY'])
threads_count = Integer(ENV['MAX_THREADS'])
threads threads_count, threads_count

preload_app!

port        Integer(ENV['PORT'])
environment ENV['RACK_ENV']

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end
