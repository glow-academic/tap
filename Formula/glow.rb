class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.11"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.11/glow-aarch64-apple-darwin.tar.gz"
      sha256 "c0dc8e34512270d64b8eb125974aa803bfe78029c4fd1e1719313dc264d78a54"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.11/glow-x86_64-apple-darwin.tar.gz"
      sha256 "870571c9cd7407e36f4c4181b250a6c1b4dd0e359a14972cd1ca82ffdff5849f"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.11/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "573b681dbf0ecb69e948d9f4b8e83aec3150b7a683d2ba534bc5efb0ccebe770"

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
