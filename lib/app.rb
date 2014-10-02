require_relative 'github_api'
require_relative 'fav_lang'

class App
  def initialize(argv, stdin=STDIN, stdout=STDOUT, stderr=STDERR, kernel=Kernel)
    @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
  end

  def execute!
    exitstatus = 0
    username = @argv.first

    json = GitHubAPI.get_user_repos username
    language = FavLang.calculate_from_repos json

    @stdout.puts language
    @kernel.exit(exitstatus)
  end
end
