class Lspyx < Formula
  desc "Python code navigation and diagnostics for AI coding agents"
  homepage "https://github.com/iyazerski/lspyx"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/iyazerski/lspyx/releases/download/v0.6.1/lspyx-aarch64-apple-darwin.tar.gz"
      sha256 "89963d19fa6b401812b05d53e45d59cc5d94e211ab5a523a633f3176cecd501d"
    end
    on_intel do
      url "https://github.com/iyazerski/lspyx/releases/download/v0.6.1/lspyx-x86_64-apple-darwin.tar.gz"
      sha256 "f89c0b08df072503d9555bbbe026f007a631aa983a76721a1b7f33b91bc3c3ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/iyazerski/lspyx/releases/download/v0.6.1/lspyx-aarch64-unknown-linux-musl.tar.gz"
      sha256 "da8c83ed8479dde87d8f61ef4071811dad53be6585b3d13b6215452071bfc7fe"
    end
    on_intel do
      url "https://github.com/iyazerski/lspyx/releases/download/v0.6.1/lspyx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cbdbc96f1581d55092a3b59c134b0f3309635db3da2462a4af4e4fdfbb224c91"
    end
  end

  def install
    bin.install "lspyx"
  end

  def caveats
    <<~EOS
      lspyx runs ty and Ruff. It uses the ones in your project's .venv first,
      then the ones on your PATH. To install them with Homebrew:
        brew install ty ruff
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lspyx --version")
  end
end
