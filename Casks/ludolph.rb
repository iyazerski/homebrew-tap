cask "ludolph" do
  version "0.1.9"
  sha256 "e25d3b0b5a9394293aa8cbdb11dd0e4da82304fce005f866275c4a14c0d9f504"

  url "https://github.com/iyazerski/ludolph/releases/download/v#{version}/Ludolph.zip"
  name "Ludolph"
  desc "Run and follow pi coding agents, from a desktop window or a phone"
  homepage "https://github.com/iyazerski/ludolph"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Ludolph.app"

  uninstall launchctl: [
              "dev.iyazerski.ludolph",
              "dev.iyazerski.ludolph.engine",
            ],
            quit:      "dev.iyazerski.ludolph"

  zap trash: [
    "~/Library/Application Support/Ludolph",
    "~/Library/LaunchAgents/dev.iyazerski.ludolph.plist",
    "~/Library/Logs/Ludolph",
  ]

  caveats <<~EOS
    Ludolph runs pi agents, so it needs pi: https://pi.dev

    Ludolph isn't notarized by Apple, so macOS blocks it the first time you open it.
    To allow it, open Ludolph once, then go to System Settings > Privacy & Security
    and click "Open Anyway" next to the message about Ludolph.
  EOS
end
