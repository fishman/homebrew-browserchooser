# Homebrew tap for browserchooser

Install [browserchooser](https://github.com/fishman/browserchooser), a
rofi-style browser picker:

```sh
brew install fishman/browserchooser/browserchooser
```

The formula builds from the tagged source tarball (it carries its Go module
vendor, so the build is offline). No separate binary asset is required.

## macOS app bundle

The formula also builds a `BrowserChooser.app` bundle into the keg, which is
needed to register as the default browser and receive links. Symlink it into
`~/Applications`:

```sh
ln -s /opt/homebrew/Cellar/browserchooser/*/BrowserChooser.app ~/Applications/
```

On Intel Homebrew (`/usr/local`), adjust the path accordingly.
