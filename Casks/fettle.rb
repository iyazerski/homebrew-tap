cask "fettle" do
  version "0.4.7"
  sha256 "58c0c006a3bef6e82cd5c25e4bb73287fe65efdd63fa04879d8d70a1c3c660c5"

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
