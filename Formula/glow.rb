class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.10"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.10/glow-aarch64-apple-darwin.tar.gz"
      sha256 "699395a855c04d004529aa9be4d6eb93a7b5f50367d03e997ba287df4e671d50"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.10/glow-x86_64-apple-darwin.tar.gz"
      sha256 "5a5092ef111fd169be8409ed8da1bb52f9940306599ca8556cc13d97a1e4d438"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.10/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92213684c2a912afba5eee460b6536fd55036cb1ce6ea746827d061d01d7c0e8"

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
