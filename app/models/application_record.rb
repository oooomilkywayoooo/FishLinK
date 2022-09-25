class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def body_cannot_contain_blacklist_words
#blacklist.ymlから不適切な言葉を読み取る
    blacklist = YAML.load_file('./config/blacklist.yml')
#contentが空でなく、bodyの中にblacklistの用語が含まれているかを追加
    if body.present? && blacklist.any?{ |word| body.include?(word) }
      errors.add(:contain_blacklist_words, ": 不適切な言葉は使用できません")
# エラー時「contain_blacklist_words　: 不適切な言葉は使用できません」と表示される。
    end
  end

  def body_cannot_contain_invalid_regex
# same_character_regex: 連続する五文字以上の語（"あああああ"）などを防ぐ

# 正規表現のエスケープのため %r!正規表現!で囲む
    invalid_regex = { same_character_regex: %r!(.)\1{4,}!}
# invalid_regexをkey,valueとして取り出しvalue.match?(content)で正規表現と一致しているかを調べる。
    if body.present? && invalid_regex.any?{|key,value| value.match?(body)}
      errors.add(:contain_invalid_regex, ":　使うことのできない文字列が含まれています")
    end
  end
end
