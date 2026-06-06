class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.20"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.20/glow-aarch64-apple-darwin.tar.gz"
      sha256 "7103fe80240e9acf2132aa06657793f1e5138b27e26dd6875f160ca84d4522a2"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.20/glow-x86_64-apple-darwin.tar.gz"
      sha256 "bb821492693eeb27535b4351868fd3f22f34bdaeafe080d6886adf1140243fe7"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.20/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57364d4432ee81aae813e1ace0016712d849d8bca264eac043bc66034af33d60"

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
