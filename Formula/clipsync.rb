class Clipsync < Formula
  desc "Sync the clipboard between Mac, Windows and Android through your own relay"
  homepage "https://github.com/iyazerski/clipsync"
  url "https://github.com/iyazerski/clipsync/releases/download/v0.1.9/clipsync-aarch64-apple-darwin.tar.gz"
  sha256 "19fc8bf25f2b059aa0cf823af2a33d95ddcf49406cf76fad77606bf8aab78370"
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
