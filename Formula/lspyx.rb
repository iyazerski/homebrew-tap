class Lspyx < Formula
  desc "Python code navigation and diagnostics for AI coding agents"
  homepage "https://github.com/iyazerski/lspyx"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/iyazerski/lspyx/releases/download/v0.6.0/lspyx-aarch64-apple-darwin.tar.gz"
      sha256 "a95efdf2a13a3af73970eee99a05dc9f8142eba7e97085daa6223e2e457c3827"
    end
    on_intel do
      url "https://github.com/iyazerski/lspyx/releases/download/v0.6.0/lspyx-x86_64-apple-darwin.tar.gz"
      sha256 "8a58868c62a4950e8f4ded94c610001c59ea4f590810b685ab542479542b2254"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/iyazerski/lspyx/releases/download/v0.6.0/lspyx-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8222005fe4df143cf2ff1207dfd385212e1463c1a224668ab7ec285c4fb01984"
    end
    on_intel do
      url "https://github.com/iyazerski/lspyx/releases/download/v0.6.0/lspyx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "131b6734eacb0b279f396ba6c17aa5922932582cf415655b31035b6d618f1b4c"
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
