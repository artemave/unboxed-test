class FavLang
  ::Language = Class.new(String)
  ::NilLanguage = Class.new

  def self.calculate_from_repos data = []
    if data.empty?
      return NilLanguage.new
    end

    sorted_languages = data.map{|repo| repo["language"]}.compact.group_by{|itself| itself}.values.max_by(&:size)

    sorted_languages ? Language.new(sorted_languages.first) : NilLanguage.new
  end
end
