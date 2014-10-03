require 'rest-client'

class GitHubAPI
  @github_api_url = 'https://api.github.com'

  class << self
    attr_accessor :github_api_url
  end

  UserNotFound = Class.new(StandardError)

  def self.get_user_repos username
    JSON.parse RestClient.get "%s/users/%s/repos" % [github_api_url, username]
  rescue RestClient::ResourceNotFound
    raise UserNotFound
  end
end
