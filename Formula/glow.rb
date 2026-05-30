class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.12"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.12/glow-aarch64-apple-darwin.tar.gz"
      sha256 "bd39b4093a12f149a78d1aa8eff9878613f1d700dde0cad18631a51910a64050"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.12/glow-x86_64-apple-darwin.tar.gz"
      sha256 "ef5e71e449c524594dc70ae9200258f83a294d9b07a26f06d5de796c46f6e42e"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.12/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2d128627d093bbfe3b379409a7292e7ea8ca83de650a46cdd26089d1f175f54c"

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
