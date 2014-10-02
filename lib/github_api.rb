require 'rest-client'

class GitHubAPI
  GITHUB_API_URL = 'https://api.github.com'

  def self.get_user_repos username
    JSON.parse RestClient.get "%s/users/%s/repos" % [GITHUB_API_URL, username]
  end
end
