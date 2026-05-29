class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.9"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.9/glow-aarch64-apple-darwin.tar.gz"
      sha256 "bfddbb39b28e9c922f01cebce5c5852a912638ae3acb4fcf7ba1947834262cf9"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.9/glow-x86_64-apple-darwin.tar.gz"
      sha256 "65d9ce5570b6607f3d8863e5536ce332eac79ccd22f81d8a430ab1a628be27fc"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.9/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9c9a793be11b01c50de33c14e538216a87081ce199e18af5459fa2683c229e3"

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
