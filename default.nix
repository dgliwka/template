let
  nixpkgs = builtins.fetchGit {
    name = "master";
    url = "https://github.com/NixOs/nixpkgs";
    ref = "refs/heads/master";
    rev = "6332928cc4f68c816d1b306a46f62867f541ea0e";
    # obtain via `git ls-remote https://github.com/NixOS/nixpkgs master`
  };
  pkgs = import nixpkgs { config = { }; };

in pkgs.mkShell {
  buildInputs = with pkgs; [
    nixfmt
    gnumake

  ];
}
