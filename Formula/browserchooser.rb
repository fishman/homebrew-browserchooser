class Browserchooser < Formula
  desc "Rofi-style browser picker for Linux, macOS, and Windows"
  homepage "https://github.com/fishman/browserchooser"
  url "https://github.com/fishman/browserchooser/archive/refs/tags/null.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"
  head "https://github.com/fishman/browserchooser.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", "-mod=vendor", *std_go_args(output: bin/"browserchooser", ldflags: "-s -w")

    # Also build the .app bundle so it can register as the default browser and
    # receive links (set-default and URL delivery need a bundle, not a bare
    # binary). Installed into the keg; copy/symlink it to /Applications.
    app = "BrowserChooser.app"
    mkdir_p "#{app}/Contents/MacOS"
    mkdir_p "#{app}/Contents/Resources"
    system "go", "build", "-mod=vendor", "-ldflags=-s -w", "-o", "#{app}/Contents/MacOS/browserchooser"
    cp "packaging/Icon.icns", "#{app}/Contents/Resources/Icon.icns"
    inreplace "packaging/Info.plist", "@VERSION@", version.to_s
    cp "packaging/Info.plist", "#{app}/Contents/Info.plist"
    prefix.install app
  end

  test do
    assert_match "Usage", shell_output("#{bin}/browserchooser --help")
  end
end
