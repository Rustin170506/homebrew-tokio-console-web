class TokioConsoleWeb < Formula
  desc "A web console for tokio"
  version "0.1.1-alpha.2"
  on_macos do
    on_arm do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/0.1.1-alpha.2/tokio-console-web-aarch64-apple-darwin.tar.gz"
      sha256 "865b33131090a6543039e3485aa41439d8615379ec6438c450ce66791c57f35f"
    end
    on_intel do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/0.1.1-alpha.2/tokio-console-web-x86_64-apple-darwin.tar.gz"
      sha256 "67060ae0d115d82e90382a8ee0c127b1600a4acb435da26b85e09ef253e6c77a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/0.1.1-alpha.2/tokio-console-web-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8118a3e30b9c7e36efb27e22a21d482d8a8c3b9bba20e47aa0be181fe964bb7a"
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
