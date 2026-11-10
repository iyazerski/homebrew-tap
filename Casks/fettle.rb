cask "fettle" do
  version "0.5.9"
  sha256 "4f10125ae0771498e5e3787c92870aa0255b788fde96129796ca9b73c0319a1b"

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
