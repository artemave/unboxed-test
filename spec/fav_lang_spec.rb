require_relative './spec_helper'
require_relative '../lib/fav_lang'

describe FavLang do
  context 'user have repos with code' do
    let(:data) do
      [{"language" => "Ruby"}, {"language" => "Ruby"}, {"language" => "PogoScript"}]
    end

    it 'returns the most common language among user repos' do
      language = FavLang.calculate_from_repos data
      expect(language).to eq "Ruby"
    end

    context 'most repos are not code' do
      before do
        3.times { data.push("language" => nil) }
      end

      it 'ignores those repos' do
        language = FavLang.calculate_from_repos data
        expect(language).to eq "Ruby"
      end
    end
  end

  context 'user does not have code' do
    let(:data) {[]}

    it 'returns NilLanguage' do
      language = FavLang.calculate_from_repos data
      expect(language).to be_an_instance_of NilLanguage
    end
  end
end
