cask "song-notifier" do
  version "0.2.0"
  sha256 "57be8fdbc8f881cdb182b0325d3e6482e9cd96215ebf2afec4fcd0b67cb31d07"

  url "https://github.com/minhquandev91/song-notifier/releases/download/v#{version}/SongNotifier-#{version}.zip"
  name "Song Notifier"
  desc "Popup and menu bar title when the Now Playing song changes"
  homepage "https://github.com/minhquandev91/song-notifier"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64
  depends_on formula: "ungive/media-control/media-control"

  app "SongNotifier.app"

  # ad-hoc signed, not notarized: drop the quarantine flag so it opens without the Gatekeeper prompt
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SongNotifier.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.quan.songnotifier.plist",
  ]
end
