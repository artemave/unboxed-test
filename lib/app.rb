require 'bundler'
Bundler.setup(:default)

require_relative 'github_api'
require_relative 'fav_lang'

class App
  def initialize(argv, stdin=STDIN, stdout=STDOUT, stderr=STDERR, kernel=Kernel)
    @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
  end

  def execute!
    exitstatus = 0

    if username = @argv.first
      data = GitHubAPI.get_user_repos username
      language = FavLang.calculate_from_repos data

      if language.is_a? NilLanguage
        exitstatus = 1
        @stderr.puts "It is hard to say..."
      else
        @stdout.puts language
      end
    else
      @stdout.puts "Usage: #{$0} USERNAME"
    end

  rescue GitHubAPI::UserNotFound
    exitstatus = 1
    @stderr.puts "User not found"
  ensure
    @kernel.exit(exitstatus)
  end
end
