class FavLang
  ::NilLanguage = Class.new

  def self.calculate_from_repos data = []
    if data.empty?
      return NilLanguage.new
    end

    data.map{|repo| repo["language"]}.compact.group_by{|itself| itself}.values.max_by(&:size).first
  end
end
