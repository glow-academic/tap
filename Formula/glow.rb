class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.21"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.21/glow-aarch64-apple-darwin.tar.gz"
      sha256 "846ae42da5d9cfa176608447f21a6c2e56cdc3e450c7f7f0c7fab1649127a10e"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.21/glow-x86_64-apple-darwin.tar.gz"
      sha256 "036752b1d9eaff78dbc370eba081931688ab090915abc87329cfa05948749c7b"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.21/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "828f4c8577755fd4b676329a536f5ef9dc3f87d7225d5429a5bcfb59c1f85706"

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
