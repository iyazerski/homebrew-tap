class Clipsync < Formula
  desc "Sync the clipboard between Mac, Windows and Android through your own relay"
  homepage "https://github.com/iyazerski/clipsync"
  url "https://github.com/iyazerski/clipsync/releases/download/v0.1.13/clipsync-aarch64-apple-darwin.tar.gz"
  sha256 "3567c830645d50b19c75e7e4eee06c59fa61cc5a233012a1a52a29ec423ec960"
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
        clipsync setup --relay https://clip.example.com
      with your relay's address. To host a relay, see
        https://github.com/iyazerski/clipsync#get-started
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clipsync --version")
  end
end
