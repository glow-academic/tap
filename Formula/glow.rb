class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.19"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.19/glow-aarch64-apple-darwin.tar.gz"
      sha256 "68ee4f1a95aa174ca353a59fdc227c3129838d8175bb15fef911b8ddcbe2bd5e"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.19/glow-x86_64-apple-darwin.tar.gz"
      sha256 "cc8a9995ea343a78ff9240827718e0bd2c2d616dbc1e88add5de01a8d761930a"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.19/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f93179878cf368a756c2179d60f28fbb4511747fdbf88ebeb254d86610db796c"

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
