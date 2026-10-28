cask "song-notifier" do
  version "0.3.3"
  sha256 "98e591f7c7688c7a97f434b38973fa815077a3bb5517716e8ea8f100b90665b0"

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
