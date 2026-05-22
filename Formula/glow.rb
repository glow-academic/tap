class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.5"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.5/glow-aarch64-apple-darwin.tar.gz"
      sha256 "17d9dabbfc48bc2cd8f383b073ec8196f21645e85b51a4468876a2d4ce1e1f25"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.5/glow-x86_64-apple-darwin.tar.gz"
      sha256 "dd0df95b08920fad9a8b36e314dc090f948f5acfff4dce04faaa27e9f2bff085"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.5/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "208214d698a5ab4a31d6c1d0e4c89bc5d126e43bfc4c3f56da6f5952ba41a7bd"

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
