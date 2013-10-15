module TracksHelper
  
  def ugly_lyrics(lyrics)
    modified = lyrics.split("\n")
    modified.map! { |each_line| "\u266b" + each_line }
    modified.join("\n")
  end
end
