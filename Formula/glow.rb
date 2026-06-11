class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.26"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.26/glow-aarch64-apple-darwin.tar.gz"
      sha256 "25df1bc560d7efcdbb634b78814cc2f7003a12cc9cd861659ce7fb1e425fa002"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.26/glow-x86_64-apple-darwin.tar.gz"
      sha256 "b1936887a274399bd9566ff9ab5113e43ccf41a9fd7f65d60443ca0b6c9291da"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.26/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "22114bb752742a019c75b052eb08fd0036bf449514ab275e199a2dba06cde3ac"

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
