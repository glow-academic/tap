class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.23"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.23/glow-aarch64-apple-darwin.tar.gz"
      sha256 "3cfa625c6c812552afe159d06d84d11850b25d1e4891e7f8f846ecf23a8eb8e1"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.23/glow-x86_64-apple-darwin.tar.gz"
      sha256 "a5f3b4f1b1334841d13a813ec5d419bbd48153c189e7b67c92a42c1cb0ac7e1b"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.23/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dff927d0809ee5c40f9535fd19326eb5d3bec01fe3d63954bfec37036a09be7d"

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
