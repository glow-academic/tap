class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.16"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.16/glow-aarch64-apple-darwin.tar.gz"
      sha256 "cc25acc81b506097e54053d24b117d512660bbf688f72e44b8173d2aac27ed5f"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.16/glow-x86_64-apple-darwin.tar.gz"
      sha256 "eb85c02f5c4651d2f7f610b3d403731801c9fc68212043edf09ca8ff916ed10b"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.16/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aced3f82455448cd232b23576d741631b838436c6c0453ad60ff50c37076e7e0"

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
