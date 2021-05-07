class Helpers
  def self.normalize_text(text)
    text.downcase.gsub(/[\-\(\)\n\"]/,'').gsub(',','.')
  end
end