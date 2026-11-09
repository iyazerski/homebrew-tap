cask "fettle" do
  version "0.5.1"
  sha256 "8eb2ed8772ae74298a9404b7f400db1d5999cc32f929b1a227c635e9c5ee3429"

  url "https://github.com/iyazerski/fettle/releases/download/v#{version}/Fettle.zip"
  name "Fettle"
  desc "Fix grammar and translate selected text in any app with one shortcut"
  homepage "https://github.com/iyazerski/fettle"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Fettle.app"

  uninstall launchctl: "dev.iyazerski.fettle",
            quit:      "dev.iyazerski.fettle"

  zap trash: [
    "~/Library/Application Support/Fettle",
    "~/Library/LaunchAgents/dev.iyazerski.fettle.plist",
    "~/Library/Logs/fettle.log",
  ]

  caveats <<~EOS
    Fettle isn't notarized by Apple, so macOS blocks it the first time you open it.
    To allow it, open Fettle once, then go to System Settings > Privacy & Security
    and click "Open Anyway" next to the message about Fettle.
  EOS
end
