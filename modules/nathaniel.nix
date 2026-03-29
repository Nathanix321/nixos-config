{ den, __findFile, ... }:
{
  den.aspects.nathaniel = {
    includes = [
      <den/primary-user>
    ];
    nixos.users.users.nathaniel.extraGroups = [
      "docker"
    ];
  };
  den.hosts.x86_64-linux.grey-slate.users.nathaniel = { };
}