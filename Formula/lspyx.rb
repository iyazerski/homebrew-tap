class Lspyx < Formula
  desc "Python code navigation and diagnostics for AI coding agents"
  homepage "https://github.com/iyazerski/lspyx"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/iyazerski/lspyx/releases/download/v0.6.2/lspyx-aarch64-apple-darwin.tar.gz"
      sha256 "096d6113c66781b7d9ba776b0b33460d61368d297390e4e2964f6638972a5dc4"
    end
    on_intel do
      url "https://github.com/iyazerski/lspyx/releases/download/v0.6.2/lspyx-x86_64-apple-darwin.tar.gz"
      sha256 "2603c0e3f50adf2ca829ff212a9375d1b615fd6828ee2b34b7ef63d28799cf75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/iyazerski/lspyx/releases/download/v0.6.2/lspyx-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4f3866eec97ab0d8cbb5b41f92acda585f145d34b498783e9f951d1db6a4c2da"
    end
    on_intel do
      url "https://github.com/iyazerski/lspyx/releases/download/v0.6.2/lspyx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a93e42e809bb8a61fc1a7c3575cd731e63334d2c7ae711bb7b1ec7f2a55730b8"
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
