{
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
  inputs = {
    den.url = "github:vic/den";

    flake-aspects.url = "github:vic/flake-aspects";

    flake-file.url = "github:vic/flake-file";

    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
      url = "github:hercules-ci/flake-parts";
    };

    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };

    import-tree.url = "github:vic/import-tree";

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nixpkgs-lib.follows = "nixpkgs";

    systems.url = "github:nix-systems/default";

    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/treefmt-nix";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nixos-hardware.url = "github:nixos/nixos-hardware";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    srvos = {
      url = "github:nix-community/srvos";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://nix-gaming.cachix.org"
      "https://attic.xuyh0120.win/lantian" # cachyos kernels
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
    ];
  };
}
