class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.13"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.13/glow-aarch64-apple-darwin.tar.gz"
      sha256 "33cacbd9a24efaf4cf5420c6d3bd18d33e4cfa0df2662de50ee6677d4fce265f"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.13/glow-x86_64-apple-darwin.tar.gz"
      sha256 "fef2c3672fa074b2f2cd55932be2f14a428b5108692a9986f02c0e2d81fda7c6"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.13/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e19d6826e29f99485e0954bad1c2e1b283049a5038bacb528ca72e78c459ffe"

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
