class Clipsync < Formula
  desc "Sync the clipboard between Mac, Windows and Android, end-to-end encrypted"
  homepage "https://github.com/iyazerski/clipsync"
  url "https://github.com/iyazerski/clipsync/releases/download/v0.1.17/clipsync-aarch64-apple-darwin.tar.gz"
  sha256 "35b334fe304585829f7403cdf8c4e62a123b1078140d94e430e7368ddd5c704f"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "clipsync"
  end

  # The background service keeps running the old version until it restarts. Without
  # one (before `clipsync setup`), kickstart fails, and that's fine.
  post_install_steps do
    run "/bin/sh", args: ["-c", 'launchctl kickstart -k "gui/$(id -u)/dev.iyazerski.clipsync"'],
                   must_succeed: false, print_stderr: false
  end

  def caveats
    <<~EOS
      To start syncing, run:
        clipsync setup
      It uses the public relay. To host your own, see
        https://github.com/iyazerski/clipsync#host-your-own-relay
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clipsync --version")
  end
end
