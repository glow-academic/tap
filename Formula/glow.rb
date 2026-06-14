class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.27"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.27/glow-aarch64-apple-darwin.tar.gz"
      sha256 "600520ba007f477b04f8978192edfed0a2ccd3257337610ec6fd77a7e609f540"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.27/glow-x86_64-apple-darwin.tar.gz"
      sha256 "107a60855c766f6f6b3812474344391425ee1cb18d0ee4749fb7cbe90acdea10"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.27/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2106c5aec133d9b0df3776a3acafdb206876caa822af87e46702a3d3533b648"

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
