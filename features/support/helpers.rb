module Helpers
  def fixture fname
    File.read File.expand_path "../fixtures/#{fname}", __FILE__
  end
end

World Helpers
