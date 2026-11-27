cask "clipsync" do
  version "0.2.6"
  sha256 "4ea359f62af3e057f8045ad05d08bb949d8d797eeb25ef461edf9f18a9173d1f"

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
