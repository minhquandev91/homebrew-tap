cask "song-notifier" do
  version "0.3.5"
  sha256 "1fbbf125e83e8093ee8f95b33232d570fa23731adee79783ea9275abe0c2e40f"

  url "https://github.com/minhquandev91/song-notifier/releases/download/v#{version}/SongNotifier-#{version}.zip"
  name "Song Notifier"
  desc "Popup and menu bar title when the Now Playing song changes"
  homepage "https://github.com/minhquandev91/song-notifier"

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "SongNotifier.app"

  # ad-hoc signed, not notarized: drop the quarantine flag so it opens without the Gatekeeper prompt
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/SongNotifier.app"], sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.quan.songnotifier.plist",
  ]
end
