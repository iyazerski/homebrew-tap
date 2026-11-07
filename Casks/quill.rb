cask "quill" do
  version "0.1.9"
  sha256 "6020b2db5b35e883a433805e2434612bbf0a9735961832857e147e230187910b"

  url "https://github.com/iyazerski/quill/releases/download/v#{version}/Quill.zip"
  name "Quill"
  desc "Fix grammar and translate selected text in any app with one shortcut"
  homepage "https://github.com/iyazerski/quill"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Quill.app"

  uninstall launchctl: "dev.iyazerski.quill",
            quit:      "dev.iyazerski.quill"

  zap trash: [
    "~/Library/Application Support/Quill",
    "~/Library/LaunchAgents/dev.iyazerski.quill.plist",
    "~/Library/Logs/quill.log",
  ]

  caveats <<~EOS
    Quill isn't notarized by Apple, so macOS blocks it the first time you open it.
    To allow it, open Quill once, then go to System Settings > Privacy & Security
    and click "Open Anyway" next to the message about Quill.
  EOS
end
