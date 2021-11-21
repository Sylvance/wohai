#!/usr/bin/env ruby
# Generate Invokers, Validators, Commands,  Callbacks and Clients.
#
USAGE = <<~USAGE
  ruby lib/templates/generate.rb Invoker flag_and_archive_todo_flow
  ruby lib/templates/generate.rb Validator check_todo_exists
  ruby lib/templates/generate.rb Command flag_todo
  ruby lib/templates/generate.rb Callback archive_todo
  ruby lib/templates/generate.rb Client import_remote_todos
USAGE

if ARGV.empty?
  puts "Usage:"
  puts USAGE
  exit(-1)
end

require 'fileutils'

# path to your application root.
APP_ROOT = File.expand_path('../..', __dir__)

Dir.chdir(APP_ROOT) do
  arg1, arg2 = ARGV[0], ARGV[1]
  class_name = arg2.split('_').map(&:capitalize).join
  file_path = "app/#{arg1.downcase}s/#{arg2}.rb"

  Dir.pwd
  FileUtils.cp("lib/templates/#{arg1.downcase}.rb", file_path)

  file = File.read(file_path)
  replacement = file.gsub("{{#{arg1}}}", class_name)
  File.open(file_path, "w") {|file| file.puts replacement}
end
