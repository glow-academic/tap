class GlowBeta < Formula
  desc "CLI for the Glow platform (beta channel) — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.15"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.15-beta/glow-beta-aarch64-apple-darwin.tar.gz"
      sha256 "23a5e04ffea1b8cfb83c58bdc89c1cbf6ad9042bebe01a1c01a3a0d2a8b3ec51"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.15-beta/glow-beta-x86_64-apple-darwin.tar.gz"
      sha256 "a400a82aef512d0123f8b4cdd4ebb8a5ff0b7c0a87b1b74545d48052b6412acb"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.15-beta/glow-beta-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3777a332fa29c921ad7dd26151d46b501174060e5b2cc3956ad4814f30c8f098"

  end

  def install
    bin.install "glow-beta"
    bin.install "glw-beta"
    generate_completions_from_executable(bin/"glow-beta", "completions")
  end

  test do
    assert_match "Glow CLI", shell_output("#{bin}/glow-beta --help")
    assert_match version.to_s, shell_output("#{bin}/glow-beta --version")
  end
end
