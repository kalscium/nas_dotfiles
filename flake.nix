{
  description = "kalscium's home-brew NAS NixOS system configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations =
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
    in
    {
      home-nas = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit pkgs; };
        modules = [
          ./configuration.nix
          ./ssh.nix
          ./zfs.nix
          ./users.nix
          ./hardware-configuration.nix
        ];
      };
    };
  };
}
