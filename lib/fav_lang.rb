class FavLang
  def self.calculate_from_repos json
    json.map{|repo| repo["language"]}.group_by{|itself| itself}.values.max_by(&:size).first
  end
end
