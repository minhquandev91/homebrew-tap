cask "song-notifier" do
  version "0.3.1"
  sha256 "85d56a1dbd23b1dda1f3408c9e77a8e55a403c5d930eba72e7472b0118d58434"

  url "https://github.com/minhquandev91/song-notifier/releases/download/v#{version}/SongNotifier-#{version}.zip"
  name "Song Notifier"
  desc "Popup and menu bar title when the Now Playing song changes"
  homepage "https://github.com/minhquandev91/song-notifier"

  depends_on macos: :ventura
  depends_on arch: :arm64
  depends_on formula: "ungive/media-control/media-control"

  app "SongNotifier.app"

  # ad-hoc signed, not notarized: drop the quarantine flag so it opens without the Gatekeeper prompt
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/SongNotifier.app"], sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.quan.songnotifier.plist",
  ]
end
