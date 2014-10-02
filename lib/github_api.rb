require 'rest-client'

class GitHubAPI
  GITHUB_API_URL = 'https://api.github.com'

  UserNotFound = Class.new(StandardError)

  def self.get_user_repos username
    JSON.parse RestClient.get "%s/users/%s/repos" % [GITHUB_API_URL, username]
  rescue RestClient::ResourceNotFound
    raise UserNotFound
  end
end
