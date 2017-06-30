Pry.config.should_load_plugins = false

Pry.config.history.file = "#{ENV['HOME']}/.irb-history"

Pry.config.prompt = proc do |obj, level, _|
  prompt = []
  prompt << "\e[31m#{File.basename(Dir.pwd)}\e[0m "
  if defined?(Rails)
    prompt << "#{Rails.version}@#{RUBY_VERSION}" if defined?(Rails)
  else
    prompt << "#{RUBY_VERSION}"
  end
  prompt << " (#{obj})" if obj.to_s != "main"
  prompt << " > "
  prompt.join
end

Pry.config.exception_handler = proc do |output, exception, _|
  output.puts "\e[31m#{exception.class}: #{exception.message}"
  output.puts "from #{exception.backtrace.first}\e[0m"
end

Pry.plugins["doc"].activate!
Pry.plugins["nav"].activate!
