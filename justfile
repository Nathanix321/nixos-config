
rebuild :
    sudo nixos-rebuild switch --flake

show:
    nix flake show

check:
    nix flake check

update:
    nix flake update

clean:
    nix-collect-garbage
