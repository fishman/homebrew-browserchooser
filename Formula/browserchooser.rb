class Browserchooser < Formula
  desc "Rofi-style browser picker for Linux, macOS, and Windows"
  homepage "https://github.com/fishman/browserchooser"
  url "https://github.com/fishman/browserchooser/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "27e1b0f0fb926093a0d283e4959922224556d611d5ea6aa6e082a0d96fe511aa"
  license "MIT"
  head "https://github.com/fishman/browserchooser.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", "-mod=vendor", *std_go_args(output: bin/"browserchooser", ldflags: "-s -w")
  end

  test do
    assert_match "Usage", shell_output("#{bin}/browserchooser --help")
  end
end
