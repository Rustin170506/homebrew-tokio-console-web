class TokioConsoleWeb < Formula
  desc "A web console for tokio"
  version "0.1.1-alpha.1"
  on_macos do
    on_arm do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/0.1.1-alpha.1/tokio-console-web-aarch64-apple-darwin.tar.gz"
      sha256 "e9f5690be4b2c19e6b6434c354ba3393cd401a7f7f8f796beac0097bf3d57bb9"
    end
    on_intel do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/0.1.1-alpha.1/tokio-console-web-x86_64-apple-darwin.tar.gz"
      sha256 "c03622d96b9a571c27d254626d92b64b0a1c7672f6159ca6842badf9e73ece44"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/0.1.1-alpha.1/tokio-console-web-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac30a921715937226f8e59012a4391beacef7fbee7c66f840abdf1b8704042c1"
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
