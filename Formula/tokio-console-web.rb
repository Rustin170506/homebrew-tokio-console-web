class TokioConsoleWeb < Formula
  desc "A web console for tokio"
  homepage "https://github.com/Rustin170506/tokio-console-web"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Rustin170506/tokio-console-web/releases/download/v0.1.1/tokio-console-web-aarch64-apple-darwin.tar.gz"
      sha256 "5670b9e8ce72a3134542d0e7f0fb2fb9a09d6ca3f094fd2de2a52b7a9a688f8b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Rustin170506/tokio-console-web/releases/download/v0.1.1/tokio-console-web-x86_64-apple-darwin.tar.gz"
      sha256 "68c4defe8b33cbf05cd4622a0b65dc41fa34769a98e48666359819317f89a73b"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Rustin170506/tokio-console-web/releases/download/v0.1.1/tokio-console-web-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "66f337605c0a46a9fc94a3314fbfc7f18da65e724a9829f79efb5825ccf17cd0"
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-pc-windows-gnu":    {},
    "x86_64-unknown-linux-gnu": {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "tokio-console-web" if OS.mac? && Hardware::CPU.arm?
    bin.install "tokio-console-web" if OS.mac? && Hardware::CPU.intel?
    bin.install "tokio-console-web" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
