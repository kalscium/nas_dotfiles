{
  # Defines the root user, can only be authorised by ssh key
  users.users."root".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICesBj/2lEYFkkK27+d0xfO6MufVItX9w427gS5gIgFi root"
  ];

  # Defines my dad's user (set a password with passwd)
  users.users."dad" = {
    isNormalUser = true;
    description = "Dad";
    extraGroups = [ "networkmanager" "uinput" ];
  };

  # Defines my user (set a password with passwd)
  users.users."kalscium" = {
    isNormalUser = true;
    description = "The maintainer of the NAS";
    extraGroups = [ "networkmanager" "uinput" "wheel" ];
  };
}
