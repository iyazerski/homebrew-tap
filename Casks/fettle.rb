cask "fettle" do
  version "0.4.4"
  sha256 "752c552fe6ba30cf0582b0d541446b9e41ef308566add7aec0689f48fe7a475c"

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
