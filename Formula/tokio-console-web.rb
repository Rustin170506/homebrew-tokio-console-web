class TokioConsoleWeb < Formula
  desc "A web console for tokio"
  version "0.1.1-beta.2"
  on_macos do
    on_arm do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/0.1.1-beta.2/tokio-console-web-aarch64-apple-darwin.tar.gz"
      sha256 "23bcd986f59e63ddc67c34ed17725b0dd61d37a79403aafe3483ff522affa5e9"
    end
    on_intel do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/0.1.1-beta.2/tokio-console-web-x86_64-apple-darwin.tar.gz"
      sha256 "78a9313e5aa77e943482294902355eace320ef2137eabcf478c3c7e998ceb32f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/0.1.1-beta.2/tokio-console-web-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c2b5e0d8c119221c65cc81f5f322af370dffd4075d68ef43ec62d56f8b5b56c2"
    end
  end
  license "MIT"

  def install
    on_macos do
      on_arm do
        bin.install "tokio-console-web"
      end
    end
    on_macos do
      on_intel do
        bin.install "tokio-console-web"
      end
    end
    on_linux do
      on_intel do
        bin.install "tokio-console-web"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
