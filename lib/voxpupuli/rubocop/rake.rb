# frozen_string_literal: true

require 'rubocop/rake_task'

RuboCop::RakeTask.new(:rubocop) do |task|
  # These make the rubocop experience maybe slightly less terrible
  task.options = ['--display-cop-names', '--display-style-guide', '--extra-details']
  # Use Rubocop's Github Actions formatter if possible
  task.formatters << 'github' if ENV['GITHUB_ACTIONS'] == 'true'
end

namespace :rubocop do
  # Do not use the `RuboCop::RakeTask` here, because it also adds the autocorrect tasks again.
  desc 'Generate or refresh the RuboCop TODO file'
  task :regenerate_todo do
    require 'rubocop/cli'
    status = RuboCop::CLI.new.run(%w[--regenerate-todo --no-auto-gen-timestamp])

    abort "RuboCop failed with status #{status}" unless status.zero?
  end
end
