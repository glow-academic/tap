class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.18"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.18/glow-aarch64-apple-darwin.tar.gz"
      sha256 "f93dc3ab2c530cc4fa6139bae4d7a796c17a4ecdeda8faa53778f990111305e4"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.18/glow-x86_64-apple-darwin.tar.gz"
      sha256 "eafb02cd67035edbe33138d9419950e522eb5b421027d7b19fa1ded8d2dd828c"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.18/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f35082ad9852e92ea1ea3cb79f54c92cd8935ced432ad3c4ad73c8cbb78d6d1"

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
