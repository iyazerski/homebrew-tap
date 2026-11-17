cask "ludolph" do
  version "0.1.38"
  sha256 "f6c88031534eddff77fee4c83c1f7082475aebb4c11be72ef807ec643e2ab9af"

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
