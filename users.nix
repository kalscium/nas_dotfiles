{
  # Defines my user (set a password with passwd)
  users.users."server" = {
    isNormalUser = true;
    description = "The maintainer of the NAS";
    extraGroups = [ "networkmanager" "uinput" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICesBj/2lEYFkkK27+d0xfO6MufVItX9w427gS5gIgFi kalscium"
    ];
  };
}
