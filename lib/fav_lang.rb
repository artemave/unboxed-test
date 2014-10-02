require 'rest-client'

class FavLang
  GITHUB_API_URL = 'https://api.github.com'

  def initialize(argv, stdin=STDIN, stdout=STDOUT, stderr=STDERR, kernel=Kernel)
    @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
  end

  def execute!
    exitstatus = 0
    username = @argv.first

    json = JSON.parse RestClient.get "%s/users/%s/repos" % [GITHUB_API_URL, username]

    language = json.map{|repo| repo["language"]}.group_by{|itself| itself}.values.max_by(&:size).first

    @stdout.puts language
    @kernel.exit(exitstatus)
  end
end
