cask "clipsync" do
  version "0.2.5"
  sha256 "e7cd8fca948b6eb5cfb2119cb6724c35c49a26f55e978be1258643ae2457808b"

  url "https://github.com/iyazerski/clipsync/releases/download/v#{version}/clipsync-#{version}-darwin-universal.tar.gz"
  name "clipsync"
  desc "Sync your clipboard across devices over any network"
  homepage "https://github.com/iyazerski/clipsync"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "clipsync.app"

  uninstall launchctl: "dev.iyazerski.clipsync",
            quit:      "dev.iyazerski.clipsync"

  zap trash: [
    "~/Library/Application Support/clipsync",
    "~/Library/LaunchAgents/dev.iyazerski.clipsync.plist",
    "~/Library/Logs/clipsync",
    "~/Library/Logs/clipsync.log",
  ]

  caveats <<~EOS
    clipsync isn't notarized by Apple, so macOS blocks it the first time you open it.
    To allow it, open clipsync once, then go to System Settings > Privacy & Security
    and click "Open Anyway" next to the message about clipsync.
  EOS
end
