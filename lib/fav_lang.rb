require_relative 'github_api'

class FavLang
  def initialize(argv, stdin=STDIN, stdout=STDOUT, stderr=STDERR, kernel=Kernel)
    @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
  end

  def execute!
    exitstatus = 0
    username = @argv.first

    json = GitHubAPI.get_user_repos username

    language = json.map{|repo| repo["language"]}.group_by{|itself| itself}.values.max_by(&:size).first

    @stdout.puts language
    @kernel.exit(exitstatus)
  end
end
