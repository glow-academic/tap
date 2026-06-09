class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.24"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.24/glow-aarch64-apple-darwin.tar.gz"
      sha256 "ed02f2daee8c5b2c5de1d7fca7284bcc7b65fbed0715e9ed43e86daba6847d1e"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.24/glow-x86_64-apple-darwin.tar.gz"
      sha256 "bbfbeec568e8dceafd0956725f539da1b392b2cb069cca3c4792b5408505623e"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.24/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "205f65573461bf9dad90691371d8648d5bdfc832f665001fee056656664a740d"

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
