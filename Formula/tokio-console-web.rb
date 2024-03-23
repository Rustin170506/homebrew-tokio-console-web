class TokioConsoleWeb < Formula
  desc "A web console for tokio"
  version "0.1.1-beta.1"
  on_macos do
    on_arm do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/0.1.1-beta.1/tokio-console-web-aarch64-apple-darwin.tar.gz"
      sha256 "eb412ed6c504b81fc2b2d86f71cc47a127914b3e0803eeca6d4db300c4322365"
    end
    on_intel do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/0.1.1-beta.1/tokio-console-web-x86_64-apple-darwin.tar.gz"
      sha256 "2220a182a65422e1b1f95a0c4c50bb161bd6f9c5279e68bf4459b3ea4712be04"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/hi-rustin/tokio-console-web/releases/download/0.1.1-beta.1/tokio-console-web-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "916aaf02936b18dc5eb5575731e8cafa41456539e2514fa4513774ac27cba7be"
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
