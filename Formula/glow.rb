class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.8"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.8/glow-aarch64-apple-darwin.tar.gz"
      sha256 "45db1e570bc1af4b9626f6210a2e969b97ffa39c39d4372dbe8f999eba625a01"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.8/glow-x86_64-apple-darwin.tar.gz"
      sha256 "139698557f9d059ae5e5df68ba3fb579e288c677982c3a5e81fcbebdbb1465e4"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.8/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a59ef8cd692ca63f8904eb742173ebe7daaeaf5f5b765d8b271a345cc377f66e"

  end

  def install
    bin.install "glow"
    bin.install "glw"
    generate_completions_from_executable(bin/"glow", "completions")
  end

  test do
    assert_match "Glow CLI", shell_output("#{bin}/glow --help")
    assert_match version.to_s, shell_output("#{bin}/glow --version")
  end
end
