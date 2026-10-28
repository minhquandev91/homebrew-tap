cask "song-notifier" do
  version "0.3.2"
  sha256 "50afcb221e4f1e33156c19ed0e09f96dd07b5160b32e341492b0af9c31063328"

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
