{
  # Defines the root user, can only be authorised by ssh key
  users.users."root".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICesBj/2lEYFkkK27+d0xfO6MufVItX9w427gS5gIgFi root"
  ];

  # Defines the general public user (set a password with passwd)
  users.users."user" = {
    isNormalUser = true;
    description = "General User";
    extraGroups = [ "networkmanager" "uinput" ];
  };
}
