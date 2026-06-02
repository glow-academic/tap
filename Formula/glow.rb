class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.14"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.14/glow-aarch64-apple-darwin.tar.gz"
      sha256 "64c20db46d1ef05d04c7337fca31637bb398a387c4f2cfe0768680945f52dc43"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.14/glow-x86_64-apple-darwin.tar.gz"
      sha256 "0ed9af2359e459c341247fe5b8ff227adaf869c5d0f07a6512bd477e5d124309"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.14/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2805f136ddc6600743338b7177fec28e0082bb2adbb41dac61aa6d5e773edc2"

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
