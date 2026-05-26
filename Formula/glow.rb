class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.6"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.6/glow-aarch64-apple-darwin.tar.gz"
      sha256 "8c07e4ee06a9bbc20dfa2db8275b27958f3f0f6366d4d37fef3c488c15b02358"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.6/glow-x86_64-apple-darwin.tar.gz"
      sha256 "4a03942ce79ad80da0aa6993dab015f09edd7582326444f2f480ed28407bf162"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.6/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d49919ca0414432f9fe8d560136171c7e94d89e1907629dbb9fe9f94f86ab25"

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
