require_relative 'github_api'
require_relative 'fav_lang'

class App
  def initialize(argv, stdin=STDIN, stdout=STDOUT, stderr=STDERR, kernel=Kernel)
    @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
  end

  def execute!
    exitstatus = 0
    username = @argv.first

    data = GitHubAPI.get_user_repos username
    language = FavLang.calculate_from_repos data

    output = if language.is_a? NilLanguage
               "It is hard to say..."
             else
               language
             end
    @stdout.puts output

  rescue GitHubAPI::UserNotFound
    exitstatus = 1
    @stderr.puts "User not found"
  ensure
    @kernel.exit(exitstatus)
  end
end
