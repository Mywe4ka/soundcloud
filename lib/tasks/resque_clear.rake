namespace :resque do
  desc "Clear pending tasks"
  task :clear => :environment do
    queues = Resque.queues
    queues.each do |queue_name|
      puts "Clearing #{queue_name}..."
      Resque.redis.del "queue:#{queue_name}"
    end

    puts "Clearing stats..."
    Resque.redis.set "stat:failed", 0
    Resque.redis.set "stat:processed", 0
  end
end