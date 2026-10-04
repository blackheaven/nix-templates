{
  description = "Nix flake templates";

  outputs = { self }: {
    templates = {
      haskell-full = {
        path = ./haskell-full;
        description = "Haskell project: library, hspec test-suite and executable";
      };
      haskell-exe = {
        path = ./haskell-exe;
        description = "Haskell project: executable only";
      };
    };
  };
}
