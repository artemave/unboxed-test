class FavLang
  def self.calculate_from_repos data = []
    data.map{|repo| repo["language"]}.compact.group_by{|itself| itself}.values.max_by(&:size).first
  end
end
