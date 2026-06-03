class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.15"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.15/glow-aarch64-apple-darwin.tar.gz"
      sha256 "92b6c781f8a303a5122278b1925fe1287b85617c05fd05e4beccccfca7d528e6"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.15/glow-x86_64-apple-darwin.tar.gz"
      sha256 "2f63cadd2d6bc605a503e2b2ad240736f64db3cd36fc77474c07f8eb0676740e"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.15/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9a0bdfbf1e762cea07eac576b166de6a7c21ed35493396e83357112a24a4066"

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
