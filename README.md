# Nix flake templates

Haskell project templates for `nix flake init`:

```bash
nix flake init -t github:blackheaven/nix-templates#haskell-full
nix flake init -t github:blackheaven/nix-templates#haskell-exe
```

## Templates

### `haskell-full`

Library + hspec test-suite (hspec-discover) + executable.

```
app/Main.hs          executable entry point
src/MyProject.hs     library module
test/Spec.hs         hspec-discover main
test/MyProjectSpec.hs
my-project.cabal
flake.nix            nixpkgs + flake-utils, callCabal2nix package, devShell
cabal.project
.github/workflows/   Haskell CI (get-tested matrix) + Nix CI
.envrc .gitignore LICENSE README.md
```

### `haskell-exe`

Executable only; same layout minus `src/` and `test/`.

## Usage

```bash
nix flake new my-project -t github:blackheaven/nix-templates#haskell-full
cd my-project
nix develop
cabal build all
cabal test all
```

Rename the placeholder `my-project` / `MyProject` throughout `my-project.cabal`, `flake.nix` and the sources.
