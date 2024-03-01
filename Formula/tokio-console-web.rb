class TokioConsoleWeb < Formula
  desc "A web console for tokio"
  version "0.1.0"
  on_macos do
    on_arm do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/v0.1.0/tokio-console-web-aarch64-apple-darwin.tar.gz"
      sha256 "3dbd61c85955c33bd42942e5834769c9b05ff7764633a13e7956123a7618fd03"
    end
    on_intel do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/v0.1.0/tokio-console-web-x86_64-apple-darwin.tar.gz"
      sha256 "8a09bb284f0f618bc5f1aec7220a6f1d9ca6400215e23fb6a0482e8069436ddf"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/v0.1.0/tokio-console-web-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8652812a658fbd64fb61e10c634986390bf32d6111d9f92a53a8973378b0fd1e"
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
