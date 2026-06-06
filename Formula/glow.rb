class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.22"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.22/glow-aarch64-apple-darwin.tar.gz"
      sha256 "438b8f07ba387b86f98257de79d7caa16d52359dedd926614575db3b06e7d03f"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.22/glow-x86_64-apple-darwin.tar.gz"
      sha256 "35f2603df9b7d1841f0eb9fa9c7de0467a898bc1c46ac9917c572afeed406e77"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.22/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a91b2c3f566fecbf3cb688876df396afd555dee77b7da0816180e376f5ba45b"

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
