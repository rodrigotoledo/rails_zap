# lib/tasks/clear_job_queue.rake

namespace :jobs do
  desc 'Clear the Active Job queue'
  task :clear_queue => :environment do
    require 'sidekiq/api'

    queue = Sidekiq::Queue.new

    if queue.size > 0
      puts "Clearing the Active Job queue..."
      queue.clear
      puts "Queue cleared successfully."
    else
      puts "The Active Job queue is already empty."
    end
  end
end
