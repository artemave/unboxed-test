class FavLang
  GITHUB_API_URL = 'https://api.github.com'

  def initialize(argv, stdin=STDIN, stdout=STDOUT, stderr=STDERR, kernel=Kernel)
    @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
  end

  def execute!
    exitstatus = 0

    @kernel.exit(exitstatus)
  end
end
