module CustomerHelper
  def refresh_possible?(session)
  	return false if session["next_refresh_possible_at"].nil?

    refresh_at = session["next_refresh_possible_at"]
    Time.now >= Time.parse(refresh_at)
  end
end
